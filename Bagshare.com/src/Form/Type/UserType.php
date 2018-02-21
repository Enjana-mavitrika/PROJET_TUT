<?php

namespace Bagshare\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('usermail', EmailType::class)
            ->add('password', RepeatedType::class, array(
                'type'             => PasswordType::class,
                 'invalid_message' => 'Les mots de passe doivent correspondre.',
                 'options'         => array('required' => true),
                 'first_options'   => array('label' => 'Votre mot de passe : *'),
                 'second_options'  => array('label' => 'Confirmer votre mot de passe : *'),
             ))
            ->add('username', TextType::class)
            ->add('userFirstName', TextType::class)
            ->add('userPhone', NumberType::class);
    }

    public function getName()
    {
        return 'user';
    }
}
