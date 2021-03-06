
/**
 * The class stores information about one class/rule of a vector layer renderer in a unified way
 * that can be used by legend model for rendering of legend.
 *
 * @see QgsSymbolLegendNode
 * @note added in 2.6
 */
class QgsLegendSymbolItem
{
%TypeHeaderCode
#include <qgslegendsymbolitem.h>
%End

  public:
    QgsLegendSymbolItem();
    //! Construct item. Does not take ownership of symbol (makes internal clone)
    //! @note parentRuleKey added in 2.8
    QgsLegendSymbolItem( QgsSymbol *symbol, const QString &label, const QString &ruleKey, bool checkable = false, int scaleMinDenom = -1, int scaleMaxDenom = -1, int level = 0, const QString &parentRuleKey = QString() );
    ~QgsLegendSymbolItem();
    QgsLegendSymbolItem( const QgsLegendSymbolItem &other );
    //QgsLegendSymbolItem &operator=( const QgsLegendSymbolItem &other );

    //! Return associated symbol. May be null.
    QgsSymbol *symbol() const;
    //! Return text label
    QString label() const;
    //! Return unique identifier of the rule for identification of the item within renderer
    QString ruleKey() const;
    //! Return whether the item is user-checkable - whether renderer supports enabling/disabling it
    bool isCheckable() const;

    //! Used for older code that identifies legend entries from symbol pointer within renderer
    QgsSymbol *legacyRuleKey() const;

    //! Determine whether given scale is within the scale range. Returns true if scale or scale range is invalid (value <= 0)
    bool isScaleOK( double scale ) const;
    //! Min scale denominator of the scale range. For range 1:1000 to 1:2000 this will return 1000.
    //! Value <= 0 means the range is unbounded on this side
    int scaleMinDenom() const;
    //! Max scale denominator of the scale range. For range 1:1000 to 1:2000 this will return 2000.
    //! Value <= 0 means the range is unbounded on this side
    int scaleMaxDenom() const;

    //! Identation level that tells how deep the item is in a hierarchy of items. For flat lists level is 0
    int level() const;

    //! Key of the parent legend node. For legends with tree hierarchy
    //! @note added in 2.8
    QString parentRuleKey() const;

    //! Set symbol of the item. Takes ownership of symbol.
    void setSymbol( QgsSymbol *s /Transfer/ );
};


typedef QList< QgsLegendSymbolItem > QgsLegendSymbolListV2;
