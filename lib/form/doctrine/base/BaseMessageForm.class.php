<?php

/**
 * Message form base class.
 *
 * @method Message getObject() Returns the current form's model object
 *
 * @package    userCache
 * @subpackage form
 * @author     Wojtek Sznapka
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 24051 2009-11-16 21:08:08Z Kris.Wallsmith $
 */
abstract class BaseMessageForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'           => new sfWidgetFormInputHidden(),
      'subject'      => new sfWidgetFormInputText(),
      'body'         => new sfWidgetFormTextarea(),
      'recipient_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('recipient'), 'add_empty' => true)),
      'created_at'   => new sfWidgetFormDateTime(),
      'updated_at'   => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'           => new sfValidatorDoctrineChoice(array('model' => $this->getModelName(), 'column' => 'id', 'required' => false)),
      'subject'      => new sfValidatorString(array('max_length' => 100, 'required' => false)),
      'body'         => new sfValidatorString(array('required' => false)),
      'recipient_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('recipient'), 'required' => false)),
      'created_at'   => new sfValidatorDateTime(),
      'updated_at'   => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('message[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'Message';
  }

}
