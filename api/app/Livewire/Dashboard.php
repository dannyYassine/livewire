<?php

namespace App\Livewire;

use Illuminate\Support\Carbon;
use Livewire\Component;

class Dashboard extends Component
{
    public $count = 1;
    public $title = '';
    public $name = 'Danny';

    protected $queryString = [
        'name'
    ];

    public function increment()
    {
        $this->count++;
    }

    public function decrement()
    {
        $this->count--;
    }

    public function getTitle(): string
    {
        return $this->title  . ' ' . Carbon::now()->format('d m:s, M Y');
    }

    public function render()
    {
        return view('livewire.dashboard');
    }
}
