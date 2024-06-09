/**
 * @Author: Ramiro Luiz Nunes
 * @Date:   2024-06-09 12:45:36
 * @Last Modified by:   Ramiro Luiz Nunes
 * @Last Modified time: 2024-06-09 13:41:12
 */

import React from 'react';
import { Button } from '@mui/material';
import { ColorEnum, SizeEnum, VariantEnum } from '../../enums/material-ui';

interface MaterialUIButtonProps {
  label: string;
  color?: ColorEnum;
  variant?: VariantEnum;
  size?: SizeEnum;
  onClick: () => void;
}

const MaterialUIButton: React.FC<MaterialUIButtonProps> = ({
  label,
  color = ColorEnum.PRIMARY,
  variant = VariantEnum.TEXT,
  size = SizeEnum.LARGE,
  onClick,
}) => {
  return (
    <Button color={color} size={size} variant={variant} onClick={onClick}>
      {label}
    </Button>
  );
};

export default MaterialUIButton;
