/*
 * Copyright 2018 Philipp Salvisberg <philipp.salvisberg@trivadis.com>
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.utplsql.sqldev.model.preference

import oracle.javatools.data.HashStructure
import oracle.javatools.data.HashStructureAdapter
import oracle.javatools.data.PropertyStorage
import org.eclipse.xtext.xbase.lib.util.ToStringBuilder

class PreferenceModel extends HashStructureAdapter {
	static final String DATA_KEY = "utplsql"

	private new(HashStructure hash) {
		super(hash)
	}

	def static getInstance(PropertyStorage prefs) {
		return new PreferenceModel(findOrCreate(prefs, DATA_KEY))
	}

	static final String KEY_UNSHARED_WORKSHEET = "unsharedWorksheet"
	static final String KEY_RESET_PACKAGE = "resetPackage"
	static final String KEY_AUTO_EXECUTE = "autoExecute"

	def isUnsharedWorksheet() {
		return getHashStructure.getBoolean(PreferenceModel.KEY_UNSHARED_WORKSHEET, true)
	}

	def setUnsharedWorksheet(boolean unsharedWorksheet) {
		getHashStructure.putBoolean(PreferenceModel.KEY_UNSHARED_WORKSHEET, unsharedWorksheet)
	}

	def isResetPackage() {
		return getHashStructure.getBoolean(PreferenceModel.KEY_RESET_PACKAGE, false)
	}

	def setResetPackage(boolean resetPackage) {
		getHashStructure.putBoolean(PreferenceModel.KEY_RESET_PACKAGE, resetPackage)
	}

	def isAutoExecute() {
		return getHashStructure.getBoolean(PreferenceModel.KEY_AUTO_EXECUTE, true)
	}

	def setAutoExecute(boolean autoExecute) {
		getHashStructure.putBoolean(PreferenceModel.KEY_AUTO_EXECUTE, autoExecute)
	}

	override toString() {
		new ToStringBuilder(this).addAllFields.toString
	}
}
