package;

import hxd.Res;
import particles.Particles2D;
import particles.loaders.ParticleLoader;

class Main extends hxd.App {    
    private var _parts : Particles2D;  

    /**
        Editor UI
    **/  
    var _ui : h2d.comp.Component;

    /**
        Create UI for editor
    **/
    private function BuildUI () {
        if(_ui != null ) _ui.remove();
        _ui = h2d.comp.Parser.fromHtml('
            <body>
                <style>
                    * {
                        font-size : 11px;
                    }
                    h1 {						
						color : #BBB;
					}
					.body {
						layout : dock;
					}

                    .main {
						padding : 10px;
						width : 240px;
						dock : right;
						layout : vertical;						
					}

                    .line {
						layout : horizontal;
                        padding: 0px;
					}

                    span {
						width : 160px;
                        padding: 0px;
					}

                    select, button {
                        height : 12px;
                    }
                </style>

                <h1>Settings</h1>
                <div class="main panel">
                    <div class="line">
                        <span>Emitter type</span>
                        <select>
                            <option>Radial</option>
                            <option>Gravity</option>
                        </select>
                    </div>
                    <div class="line">
                        <span>Blend mode</span>
                        <select>
                            <option>Add</option>
                            <option>Multyply</option>
                        </select>
                    </div>
                    <div class="line">
                        <span>Duration</span>
                        <value value="-1" increment="1"/>
                    </div>
                    <div class="line">
                        <span>Angle</span>
                        <value value="0" increment="1"/>
                    </div>
                    <div class="line">
                        <span>    Variance</span>
                        <value value="0" increment="0.1"/>
                    </div>    
                    <div class="line">
                        <span>Start Color</span>
                        <button value="Color"/>
                    </div>                    
                    <div class="line">
                        <span>    Variance</span>
                        <button value="Color"/>
                    </div>                                    
                    <div class="line">
                        <span>Finish Color</span>
                        <button value="Color"/>
                    </div>                    
                    <div class="line">
                        <span>    Variance</span>
                        <button value="Color"/>
                    </div>
                    <div class="line">
                        <span>Start Particle Size</span>
                        <value value="10" increment="1"/>
                    </div>  
                    <div class="line">
                        <span>    Variance</span>
                        <value value="1" increment="1"/>
                    </div>
                    <div class="line">
                        <span>Finish Particle Size</span>
                        <value value="10" increment="1"/>
                    </div>  
                    <div class="line">
                        <span>    Variance</span>
                        <value value="1" increment="1"/>
                    </div>
                    <div class="line">
                        <span>Gravity X</span>
                        <value value="0" increment="1"/>
                    </div>
                    <div class="line">
                        <span>Gravity Y</span>
                        <value value="900" increment="1" onchange="api.parts.gravity.y = this.value" />
                    </div>
                    <div class="line">
                        <span>Max particles</span>
                        <value value="500" increment="1" onchange="api.parts.maxParticles = this.value" />
                    </div>
                    <div class="line">
                        <span>Max radius</span>
                        <value value="400" increment="1"/>
                    </div>
                    <div class="line">
                        <span>    Variance</span>
                        <value value="10" increment="1"/>
                    </div>
                    <div class="line">
                        <span>Min radius</span>
                        <value value="400" increment="1"/>
                    </div>
                    <div class="line">
                        <span>    Variance</span>
                        <value value="10" increment="1"/>
                    </div>
                    <div class="line">
                        <span>Particle Life Span</span>
                        <value value="1" increment="1"/>
                    </div>
                    <div class="line">
                        <span>    Variance</span>
                        <value value="0" increment="1"/>
                    </div>
                     <div class="line">
                        <span>Position type</span>
                        <select>
                            <option>1</option>
                            <option>2</option>
                        </select>
                    </div>
                    <div class="line">
                        <span>Radial Acceleration</span>
                        <value value="1" increment="1"/>
                    </div>
                    <div class="line">
                        <span>    Variance</span>
                        <value value="0" increment="1"/>
                    </div>
                    <div class="line">
                        <span>Rotate Per Second</span>
                        <value value="1" increment="1"/>
                    </div>
                    <div class="line">
                        <span>    Variance</span>
                        <value value="0" increment="1"/>
                    </div>
                    <div class="line">
                        <span>Rotation Start</span>
                        <value value="1" increment="1"/>
                    </div>
                    <div class="line">
                        <span>    Variance</span>
                        <value value="0" increment="1"/>
                    </div>
                    <div class="line">
                        <span>Rotation End</span>
                        <value value="1" increment="1"/>
                    </div>
                    <div class="line">
                        <span>    Variance</span>
                        <value value="0" increment="1"/>
                    </div>
                    <div class="line">
                        <span>Speed</span>
                        <value value="1" increment="1"/>
                    </div>
                    <div class="line">
                        <span>    Variance</span>
                        <value value="0" increment="1"/>
                    </div>
                    <div class="line">
                        <span>Tangential Acceleration</span>
                        <value value="1" increment="1"/>
                    </div>
                    <div class="line">
                        <span>    Variance</span>
                        <value value="0" increment="1"/>
                    </div>
                    <div class="line">
                        <span>Y Coord Flipped</span>
                        <value value="1" increment="1"/>
                    </div>
                </div>
            </body>
        ', {
            parts : _parts
        });

        s2d.addChildAt(_ui,0);
    }

    override function init() {
        _parts = ParticleLoader.Load (Res.fire_plist, Res.fire_png.toTile ());
        _parts.x = s2d.width / 2;
        _parts.y = s2d.height / 2;        
        s2d.addChild (_parts);
        _parts.Emit (true);

        BuildUI ();        
    }    

    // on each frame
    override function update (dt : Float) {
    }        

    static function main() {
        Res.initEmbed ();
        new Main();
    }
}