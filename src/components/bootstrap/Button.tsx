/**
 * @Author: Ramiro Luiz Nunes
 * @Date:   2024-06-08 21:46:17
 * @Last Modified by:   Ramiro Luiz Nunes
 * @Last Modified time: 2024-06-09 13:03:15
 */

import React from 'react'
import { Button } from 'react-bootstrap'
import { SizeEnum, VariantEnum } from '../../enums/bootstrap';

interface BootstrapButtonProps {
  label: string;
  variant?: VariantEnum;
  size?: SizeEnum;
  onClick: () => void;
}

const BootstrapButton: React.FC<BootstrapButtonProps> = ({
  label,
  variant = VariantEnum.PRIMARY,
  size = SizeEnum.LARGE,
  onClick,
}) => {
  return (
    <Button variant={variant} size={size} onClick={onClick}>
      {label}
    </Button>
  );
};

export default BootstrapButton;
