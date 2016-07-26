## Scaffold generator for <a href="https://github.com/sands-consulting/asasi">Sands Asasi (Laravel-Base)</a>
Published and modify templates for other laravel 5 base.

### Install

Install using composer

```
composer require sands/asasi-scaffold
```

Publish Templates

```
php artisan vendor:publish --provider="Sands\Scaffold\ScaffoldServiceProvider" --tag="templates"
```
Published templates can be found at config/sands/asasi/scaffold/templates


### Usage

Generate

```
php artisan scaffold:generate
```

OR

```
scaffold:make {table_name : Database table name. For example: user_tasks} {fields : Field definitions separated by "|". For example: name:Name:string|completed_at:Completed At:dateTime|is_completed:Is Completed:boolean} {relationships? : Model relationships separated by "|". For example: belongsTo:Country:countries:country_id|hasMany:Children:children:parent_id|hasOne:Profile:user_profile:profile_id} {--nesting= : Route nesting configuration following ModelName:foreign_key:route-binding. For example: UserBlacklists:user_blacklist_id:user-blacklists}
```

