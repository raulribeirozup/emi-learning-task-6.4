//
//  TipoDePokemonView.swift
//  LearningTask-6.5
//
//  Created by rafael.rollo on 11/04/2022.
//

import UIKit

@IBDesignable class TipoDePokemonView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Subviews
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(TipoDePokemonCell.self,
                                forCellWithReuseIdentifier: TipoDePokemonCell.reuseId)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.clipsToBounds = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Propriedades
    override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width, height: 24)
    }
    
    private var tipo: [Tipo] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Inicializacao
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        addSubview(collectionView)
    }
    
    private func addConstraints() {        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    // MARK: - Gestão da coleção
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tipo.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TipoDePokemonCell.reuseId, for: indexPath) as? TipoDePokemonCell else {
            fatalError("Não foi possível carregar a celula")
        }
    
        cell.setup(tipo[indexPath.row])
        return cell
    }
    
    // MARK: - API pública
    func set(_ tipo: [Tipo]) {
        self.tipo = tipo
    }
    
}

fileprivate class TipoDePokemonCell: UICollectionViewCell {
    static var reuseId: String {
        return String(describing: self)
    }
    
    private static let font: UIFont = .systemFont(ofSize: 12, weight: .light)
    
    // MARK: subviews
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBackground
        label.font = TipoDePokemonCell.font
        return label
    }()
    
    // MARK: Inicialização
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        applyTheme()
        addViews()
        addConstraints()
    }
    
    private func applyTheme() {
        layer.cornerRadius = 8
    }
    
    private func addViews() {
        addSubview(label)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    fileprivate static func calculateMinCellSize(for label: String, in parent: UIView) -> CGSize? {
        let horizontalPadddingSize: CGFloat = 16
        let fontAttributes = [NSAttributedString.Key.font: TipoDePokemonCell.font]
        
        let size = (label as NSString).size(withAttributes: fontAttributes)
        let adjustedSize = size.width + horizontalPadddingSize * 2
        
        return CGSize(width: adjustedSize, height: parent.bounds.height)
    }
    
    // MARK: API
    func setup(_ tipo: Tipo) {
        backgroundColor = UIColor.init(named: tipo.rawValue)?.withAlphaComponent(0.8)
        label.text = tipo.rawValue
    }
}

extension TipoDePokemonView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let defaultSize = CGSize(width: 100, height: collectionView.bounds.height)
        
        let tipo = tipo[indexPath.row]
        
        guard let size = TipoDePokemonCell.calculateMinCellSize(for: tipo.rawValue, in: collectionView) else {
            return defaultSize
        }

        return size
    }
}
