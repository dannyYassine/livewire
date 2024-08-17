<?php

namespace App\Livewire;

use Illuminate\Support\Carbon;
use Livewire\Component;

class Counter extends Component
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
        return <<<'HTML'
        <div>
            @if ($count > 1)
            <p>Count is high!</p>
            @endif

            <h1>{{ $count }}</h1>
            
            <h1 wire:model="title"></h1>
            <h1>{{ $this->getTitle() }}</h1>

            <button wire:click="increment" wire:loading.attr="disabled">+</button>

            <button wire:click="decrement" wire:loading.attr="disabled">-</button>

            <div wire:loading.delay wire:target="increment">  
                incrementing...
            </div>

            <div wire:loading.delay wire:target="decrement">  
                decrementing...
            </div>

            <div>
            <input type="text" wire:model.live="title"> 

            <textarea wire:model="title"></textarea> 

            <div style="margin: 20px 0">Using AlpineJS</div>
            <!-- Using alpine for 100% reactivity -->
            <div x-data="{ name: @entangle('name') }">
                <input type="text" x-model="name" placeholder="Enter your name">

                <h1>Hello, <span x-text="name"></span></h1>
            </div>
            </div>
        </div>
        HTML;
    }
}
