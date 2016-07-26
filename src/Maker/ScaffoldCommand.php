<?php

namespace Sands\Asasi\Scaffold\Maker;

use Illuminate\Console\Command;
use Illuminate\Contracts\Console\Kernel;

class ScaffoldCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'scaffold:generate';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Install Sands Asasi Module';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct(Kernel $artisan)
    {
        parent::__construct();
        $this->artisan = $artisan;
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $this->setDBStructure();
        $this->line('Module install successful. Fill up your seeder and include it in AsasiSeeder then Run: php artisan migrate --seed');
    }

    protected function setDBStructure()
    {
        while (!isset($done)) {
            $inputs['table'] = $this->ask('What is the table name?', 'user_tasks');
            $inputs['fields'] = $this->ask(
                'Field definitions separated by "|"',
                'name:Name:string|completed_at:Completed At:dateTime|is_completed:Is Completed:boolean'
            );
            $inputs['relationships'] = $this->ask(
                'Model relationships separated by "|"',
                'belongsTo:Country:countries:country_id|hasMany:Children:children:parent_id|hasOne:Profile:user_profile:profile_id'
            );
            
            if ($this->confirm("Command generated from input:\n Table: {$inputs['table']}\n Fields: {$inputs['fields']}\n Relationship: {$inputs['relationships']}\n", true)) {
                $done = true;
            }
        }

        $this->artisan->call('scaffold:make', $inputs);
    }

    /* Utilities */

    protected function askOptional($question)
    {
        $answer = $this->ask($question, '(empty)');
        return '(empty)' == $answer ? null : $answer;
    }
}
