admob for flash android
this lib enable you to add admob ad to your flash air application
to add native advertisement to your actionscript3 application you just need to do four step

1.replace  D:\Program Files\Adobe\Adobe Flash Builder 4.6\sdks\4.6.1\lib\android\lib\resources\android-res.jar   with android-res.jar

2. add this config to -app.xml
<android>
        <manifestAdditions><![CDATA[
			<manifest android:installLocation="auto">
				<uses-sdk android:targetSdkVersion="11"/>
				<uses-sdk android:minSdkVersion="8"/>
			    	<uses-permission android:name="android.permission.INTERNET"/>
			    	<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
			   	 <application>
			   		<!--  <activity android:name="com.google.ads.AdActivity" android:configChanges="keyboard|keyboardHidden|orientation"/> -->
			  		 <activity android:name="com.google.ads.AdActivity" android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize"/> 
				</application>
			</manifest>
			
		]]></manifestAdditions>
    </android>

3.add this config to -app.xml
    <extensions>
    	<extensionID>so.cuo.ane.Admob</extensionID>
    </extensions>
4. add  code to your android air application like follow
		test1();
		private function test1():void
		{
			var admob:Admob=Admob.getInstance();
			if(admob.isSupported){
				admob.setUnitId(gid);
				admob.dispatcher.addEventListener(AdEvent.onReceiveAd,this.adHandler);
				admob.dispatcher.addEventListener(AdEvent.onFailedToReceiveAd,this.adHandler);
//				admob.showRelation(AdMobAlignment.ALIGN_BOTTOM,AdType.BANNER);
				admob.show(50,100,AdType.BANNER);
			}else{
				trace("not support");
			}
		}

		protected function adHandler(event:AdEvent):void
		{
			trace("receive ad");
		}