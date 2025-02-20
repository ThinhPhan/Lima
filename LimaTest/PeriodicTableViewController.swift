//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit
import Lima

class PeriodicTableViewController: UIViewController {
    enum Group {
        case alkaliMetal
        case alkalineEarthMetal
        case lanthanide
        case actinide
        case transitionMetal
        case postTransitionMetal
        case metalloid
        case reactiveNonmetal
        case nobleGas
        case unknown

        var color: UIColor {
            let color: UIColor

            switch (self) {
            case .alkaliMetal:
                color = UIColor(0xff6268)

            case .alkalineEarthMetal:
                color = UIColor(0xffddb2)

            case .lanthanide:
                color = UIColor(0xffbffb)

            case .actinide:
                color = UIColor(0xff98c9)

            case .transitionMetal:
                color = UIColor(0xffbfc1)

            case .postTransitionMetal:
                color = UIColor(0xcccccc)

            case .metalloid:
                color = UIColor(0xcbcc9e)

            case .reactiveNonmetal:
                color = UIColor(0xe5ff9c)

            case .nobleGas:
                color = UIColor(0xbeffff)

            case .unknown:
                color = UIColor(0xe8e8e8)
            }

            return color
        }
    }

    // Element view
    class ElementView: LMColumnView {
        init() {
            super.init(frame: CGRect())

            width = 48
            height = 48
        }

        convenience init(_ number: Int, _ symbol: String, _ group: Group) {
            self.init()

            directionalLayoutMargins = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)

            spacing = 0

            addSubview(UILabel(text: String(number),
                textAlignment: .center,
                textColor: UIColor(0x0c47a7),
                font: .preferredFont(forTextStyle: .caption1)))

            addSubview(UILabel(text: symbol,
                textAlignment: .center,
                textColor: UIColor(0x0c47a7),
                font: .preferredFont(forTextStyle: .body),
                weight: 1))

            backgroundColor = group.color

            layer.borderColor = UIColor(0x8d1af6).cgColor
            layer.borderWidth = 0.5
        }

        required init?(coder decoder: NSCoder) {
            return nil
        }
    }

    // Key view
    class KeyView: LMColumnView {
        init(_ text: String, _ group: Group) {
            super.init(frame: CGRect())

            directionalLayoutMargins = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

            addSubview(UILabel(text: text,
                textAlignment: .center,
                font: .preferredFont(forTextStyle: .caption1),
                numberOfLines: 0))

            backgroundColor = group.color

            weight = 1
        }

        required init?(coder decoder: NSCoder) {
            return nil
        }
    }

    override func loadView() {
        let rowStyle = { (row: LMRowView) in
            row.spacing = 4
        }

        view = LMScrollView(backgroundColor: UIColor(0xffffff),
            LMColumnView(margin: 8,
                LMColumnView(spacing: 4,
                    LMRowView(
                        ElementView(1, "H", .reactiveNonmetal),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(2, "He", .nobleGas),
                        with: rowStyle
                    ),
                    LMRowView(
                        ElementView(3, "Li", .alkaliMetal),
                        ElementView(4, "Be", .alkalineEarthMetal),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(5, "B", .metalloid),
                        ElementView(6, "C", .reactiveNonmetal),
                        ElementView(7, "N", .reactiveNonmetal),
                        ElementView(8, "O", .reactiveNonmetal),
                        ElementView(9, "F", .reactiveNonmetal),
                        ElementView(10, "Ne", .nobleGas),
                        with: rowStyle
                    ),
                    LMRowView(
                        ElementView(11, "Na", .alkaliMetal),
                        ElementView(12, "Mg", .alkalineEarthMetal),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(13, "Al", .postTransitionMetal),
                        ElementView(14, "Si", .metalloid),
                        ElementView(15, "P", .reactiveNonmetal),
                        ElementView(16, "S", .reactiveNonmetal),
                        ElementView(17, "Cl", .reactiveNonmetal),
                        ElementView(18, "Ar", .nobleGas),
                        with: rowStyle
                    ),
                    LMRowView(
                        ElementView(19, "K", .alkaliMetal),
                        ElementView(20, "Ca", .alkalineEarthMetal),
                        ElementView(21, "Sc", .transitionMetal),
                        ElementView(22, "Ti", .transitionMetal),
                        ElementView(23, "V", .transitionMetal),
                        ElementView(24, "Cr", .transitionMetal),
                        ElementView(25, "Mn", .transitionMetal),
                        ElementView(26, "Fe", .transitionMetal),
                        ElementView(27, "Co", .transitionMetal),
                        ElementView(28, "Ni", .transitionMetal),
                        ElementView(29, "Cu", .transitionMetal),
                        ElementView(30, "Zn", .postTransitionMetal),
                        ElementView(31, "Ga", .postTransitionMetal),
                        ElementView(32, "Ge", .metalloid),
                        ElementView(33, "As", .metalloid),
                        ElementView(34, "Se", .reactiveNonmetal),
                        ElementView(35, "Br", .reactiveNonmetal),
                        ElementView(36, "Kr", .nobleGas),
                        with: rowStyle
                    ),
                    LMRowView(
                        ElementView(37, "Rb", .alkaliMetal),
                        ElementView(38, "Sr", .alkalineEarthMetal),
                        ElementView(39, "Y", .transitionMetal),
                        ElementView(40, "Zr", .transitionMetal),
                        ElementView(41, "Nb", .transitionMetal),
                        ElementView(42, "Mo", .transitionMetal),
                        ElementView(43, "Tc", .transitionMetal),
                        ElementView(44, "Ru", .transitionMetal),
                        ElementView(45, "Rh", .transitionMetal),
                        ElementView(46, "Pd", .transitionMetal),
                        ElementView(47, "Ag", .transitionMetal),
                        ElementView(48, "Cd", .postTransitionMetal),
                        ElementView(49, "In", .postTransitionMetal),
                        ElementView(50, "Sn", .postTransitionMetal),
                        ElementView(51, "Sb", .metalloid),
                        ElementView(52, "Te", .metalloid),
                        ElementView(53, "I", .reactiveNonmetal),
                        ElementView(54, "Xe", .nobleGas),
                        with: rowStyle
                    ),
                    LMRowView(
                        ElementView(55, "Cs", .alkaliMetal),
                        ElementView(56, "Ba", .alkalineEarthMetal),
                        ElementView(57, "La", .lanthanide),
                        ElementView(72, "Hf", .transitionMetal),
                        ElementView(73, "Ta", .transitionMetal),
                        ElementView(74, "W", .transitionMetal),
                        ElementView(75, "Re", .transitionMetal),
                        ElementView(76, "Os", .transitionMetal),
                        ElementView(77, "Ir", .transitionMetal),
                        ElementView(78, "Pt", .transitionMetal),
                        ElementView(79, "Au", .transitionMetal),
                        ElementView(80, "Hg", .postTransitionMetal),
                        ElementView(81, "Tl", .postTransitionMetal),
                        ElementView(82, "Pb", .postTransitionMetal),
                        ElementView(83, "Bi", .postTransitionMetal),
                        ElementView(84, "Po", .postTransitionMetal),
                        ElementView(85, "At", .metalloid),
                        ElementView(86, "Rn", .nobleGas),
                        with: rowStyle
                    ),
                    LMRowView(
                        ElementView(87, "Fr", .alkaliMetal),
                        ElementView(88, "Ra", .alkalineEarthMetal),
                        ElementView(89, "Ac", .actinide),
                        ElementView(104, "Rf", .transitionMetal),
                        ElementView(105, "Db", .transitionMetal),
                        ElementView(106, "Sg", .transitionMetal),
                        ElementView(107, "Bh", .transitionMetal),
                        ElementView(108, "Hs", .transitionMetal),
                        ElementView(109, "Mt", .unknown),
                        ElementView(110, "Ds", .unknown),
                        ElementView(111, "Rg", .unknown),
                        ElementView(112, "Cn", .postTransitionMetal),
                        ElementView(113, "Nh", .unknown),
                        ElementView(114, "Fl", .unknown),
                        ElementView(115, "Mc", .unknown),
                        ElementView(116, "Lv", .unknown),
                        ElementView(117, "Ts", .unknown),
                        ElementView(118, "Og", .unknown),
                        with: rowStyle
                    ),
                    LMRowView(
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(58, "Ce", .lanthanide),
                        ElementView(59, "Pr", .lanthanide),
                        ElementView(60, "Nd", .lanthanide),
                        ElementView(61, "Pm", .lanthanide),
                        ElementView(62, "Sm", .lanthanide),
                        ElementView(63, "Eu", .lanthanide),
                        ElementView(64, "Gd", .lanthanide),
                        ElementView(65, "Tb", .lanthanide),
                        ElementView(66, "Dy", .lanthanide),
                        ElementView(67, "Ho", .lanthanide),
                        ElementView(68, "Er", .lanthanide),
                        ElementView(69, "Tm", .lanthanide),
                        ElementView(70, "Yb", .lanthanide),
                        ElementView(71, "Lu", .lanthanide),
                        ElementView(),
                        with: rowStyle
                    ),
                    LMRowView(
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(90, "Th", .actinide),
                        ElementView(91, "Pa", .actinide),
                        ElementView(92, "U", .actinide),
                        ElementView(93, "Np", .actinide),
                        ElementView(94, "Pu", .actinide),
                        ElementView(95, "Am", .actinide),
                        ElementView(96, "Cm", .actinide),
                        ElementView(97, "Bk", .actinide),
                        ElementView(98, "Cf", .actinide),
                        ElementView(99, "Es", .actinide),
                        ElementView(100, "Fm", .actinide),
                        ElementView(101, "Md", .actinide),
                        ElementView(102, "No", .actinide),
                        ElementView(103, "Lr", .actinide),
                        ElementView(),
                        with: rowStyle
                    )
                ),

                LMSpacer(height: 0.5, backgroundColor: .lightGray),

                LMRowView(
                    KeyView("Alkali metal", .alkaliMetal),
                    KeyView("Alkaline earth metal", .alkalineEarthMetal),
                    KeyView("Lanthanide", .lanthanide),
                    KeyView("Actinide", .actinide),
                    KeyView("Transition metal", .transitionMetal),
                    KeyView("Post-transition metal", .postTransitionMetal),
                    KeyView("Metalloid", .metalloid),
                    KeyView("Reactive nonmetal", .reactiveNonmetal),
                    KeyView("Noble gas", .nobleGas),
                    KeyView("Unknown", .unknown)
                )
            )
        )
    }
}

