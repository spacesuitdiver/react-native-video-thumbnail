import { NativeModules } from 'react-native';
const RNVideoThumbnail = NativeModules.RNVideoThumbnail;

export default {
	getThumbnail: () => {
		RNVideoThumbnail.getThumbnail();
	}
}