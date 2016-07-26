<?php namespace App;

use Cviebrock\EloquentSluggable\SluggableInterface;
use Venturecraft\Revisionable\RevisionableTrait;
use Cviebrock\EloquentSluggable\SluggableTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ModelName extends Model implements SluggableInterface {

    use SluggableTrait;
    use RevisionableTrait;
    use SoftDeletes;

    protected $revisionEnabled = true;
    protected $revisionCleanup = true;
    protected $historyLimit = 100;
    protected $revisionCreationsEnabled = true;

    protected $fillable = [
FILLABLECOLUMN
    ];

    protected $hidden = [
        // hidden column
    ];

    protected $attributes = [
        // default attributes value
        'status' => 'inactive'
    ];

    protected $searchacble = [
FILLABLECOLUMN
    ];

    protected $sortable = [
FILLABLECOLUMN
    ];

    public function getRevisionFormattedFieldNames()
    {
        return [
REVISIONABLENAME
        ];
    }

    public function getRevisionFormattedFields()
    {
        return [
REVISIONABLEVALUE
        ];
    }

    public function blacklists()
    {
        return $this->hasMany(UserBlacklist::class);
    }

    public function roles()
    {
        return $this->belongsToMany(Role::class);
    }

    public function getActiveAttribute()
    {
        return $this->status == 'active';
    }

    public function getBlacklistedAttribute()
    {
        return $this->blacklists()->active()->count() > 0;
    }

    /*
     * Options scope
     */

    public function scopeOptions()
    {
        return ['Select Model Name'] + static::orderBy('name')->lists('name', 'id');
    }

    /*
     * Search scopes
     */

    public function scopeSearch($query, $queries = [])
    {
        if (isset($queries['keywords']) && !empty($queries['keywords'])) {
            $keywords = $queries['keywords'];
            foreach ($this->searchable as $column) {
                $query->orWhere($column, 'LIKE', "%$keywords%");
            }
            unset($queries['keywords']);
        }

        if (isset($queries['role']) && !empty($queries['role'])) {
            $role   = $queries['role'];
            $query->whereHas('roles', function ($roles) use ($role) {
                $roles->whereId($role);
            });
            unset($queries['role']);
        }

        foreach ($queries as $key => $value) {
            if (empty($value)) {
                continue;
            }
            $query->orWhere($key, $value);
        }
    }

    public function scopeSort($query, $column, $direction)
    {
        if (in_array($column, $this->sortable) && in_array($direction, ['asc', 'desc'])) {
            $query->orderBy($column, $direction);
        }
    }

    /*
     * ACL functions
     */

    public function hasRole($role)
    {
        return $this->roles()->whereName($role)->count() == 1;
    }

    public function hasRoles($roles)
    {
        return $this->roles()->whereName($roles)->count() > 0;
    }

    public function hasPermission($permission)
    {
        return in_array($permission, $this->cachedPermissions());
    }

    public function hasPermissions($permissions=[])
    {
        return count(array_intersect($this->cachedPermissions(), $permissions)) > 0;
    }

     public function hasAllPermissions($permissions=[])
    {
        return count(array_intersect($this->cachedPermissions(), $permissions)) == count($permissions);
    }

    protected function cachedPermissions()
    {
        $that = $this;
        return Cache::rememberForever('user_permissions_'.$this->getKey(), function () use ($that) {
            return Permission::join('permission_role', 'permission_role.permission_id', '=', 'permissions.id')
                                        ->whereIn('permission_role.role_id', $that->roles->lists('id')->toArray())
                                        ->lists('name')
                                        ->toArray();
        });
    }

FKMODELMETHODS

    public static function boot()
    {
        parent::boot();
    }
}
