import { useEffect, useState } from 'react';

export default function SuccessAnimation() {
  const [Lottie, setLottie] = useState<any>(null);

  useEffect(() => {
    if (typeof window !== 'undefined') {
      import('lottie-react').then((module) => {
        setLottie(module.default);
      });
    }
  }, []);

  if (!Lottie) {
    return <div>Loading animation...</div>;
  }

  const successfullScanAnimation = require("../../lottie/success-scan.json");

  return (
    <Lottie
      animationData={successfullScanAnimation}
      loop={false}
      style={{ width: 200, height: 200 }}
    />
  );
}
