//
//  Model+Paginatable.swift
//  Pagination
//
//  Created by Anthony Castelli on 4/5/18.
//

import Foundation
import Fluent
import Vapor

extension Model where Self: Paginatable {
    /// Returns a paginated response on `.all()` entities
    /// using page number from the request data
    public static func paginate(for req: Request, pageKey: String = Pagination.defaultPageKey, perPageKey: String = Pagination.defaultPerPageKey, _ sorts: [QuerySort] = Self.defaultPageSorts) throws -> Future<Page<Self>> {
        return try Self.query(on: req).paginate(
            for: req,
            pageKey: pageKey,
            perPageKey: perPageKey,
            sorts
        )
    }
}
