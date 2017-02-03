package;

import hxd.Res;
import particles.Particles2D;
import particles.loaders.ParticleLoader;

class Main extends hxd.App {    
    var parts : Particles2D;  

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
                    h1 {
						font-size : 10px;
						color : #BBB;
					}
					.body {
						layout : dock;
					}

                    .main {
						padding : 15px;
						width : 202px;
						dock : right;
						layout : vertical;
						vertical-spacing : 10px;
					}

                    .line {
						layout : horizontal;
					}

                    span {
						width : 150px;
					}

                    button {
                        height : 14px;
                    }
                </style>

                <h1>Settings</h1>
                <div class="main panel">
                    <div class="line">
                        <span>Angle</span>
                        <value value="0" increment="1"/>
                    </div>
                    <div class="line">
                        <span>Angle Variance</span>
                        <value value="0" increment="0.1"/>
                    </div>                    
                    <div class="line">
                        <span>Blend mode</span>
                    </div>
                    <div class="line">
                        <span>Duration</span>
                        <value value="-1" increment="1"/>
                    </div>
                    <div class="line">
                        <span>Emitter type</span>
                    </div>
                    <div class="line">
                        <span>Finish Color</span>
                        <button value="Color"/>
                    </div>                    
                    <div class="line">
                        <span>Finish Color Variance</span>
                        <button value="Color"/>
                    </div>                    
                </div>
            </body>
        ');

        s2d.addChildAt(_ui,0);
    }

    override function init() {
        /*parts = ParticleLoader.Load (Res.fire_plist, Res.fire_png.toTile ());
        parts.x = s2d.width / 2;
        parts.y = s2d.height / 2;        
        s2d.addChild (parts);
        parts.Emit (true);*/

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