#--------------------------------------------------------------------------
# Copyrights
#
# Portions created by or assigned to Cursive Systems, Inc. are
# Copyright (c) 2002-2004 Cursive Systems, Inc.  All Rights Reserved.  Contact
# information for Cursive Systems, Inc. is available at
# http://www.cursive.net/.
#
# License
#
# Jabber-Net can be used under either JOSL or the GPL.
# See LICENSE.txt for details.
# --------------------------------------------------------------------------

# The purpose of this Makefile is to facilitate mono builds.

BASEDIR:=$(shell pwd)

SOURCES = \
$(BASEDIR)/AssemblyInfo.cs \
$(BASEDIR)/jabber/JID.cs \
$(BASEDIR)/jabber/client/JabberClient.cs \
$(BASEDIR)/jabber/client/PresenceManager.cs \
$(BASEDIR)/jabber/client/RosterManager.cs \
$(BASEDIR)/jabber/connection/sasl/PlainProcessor.cs \
$(BASEDIR)/jabber/connection/sasl/MD5Processor.cs \
$(BASEDIR)/jabber/connection/sasl/SASLProcessor.cs \
$(BASEDIR)/jabber/connection/IQTracker.cs \
$(BASEDIR)/jabber/connection/States.cs \
$(BASEDIR)/jabber/connection/SocketElementStream.cs \
$(BASEDIR)/jabber/server/XdbTracker.cs \
$(BASEDIR)/jabber/server/JabberService.cs \
$(BASEDIR)/jabber/protocol/x/Event.cs \
$(BASEDIR)/jabber/protocol/x/Delay.cs \
$(BASEDIR)/jabber/protocol/x/Data.cs \
$(BASEDIR)/jabber/protocol/x/Factory.cs \
$(BASEDIR)/jabber/protocol/iq/VCard.cs \
$(BASEDIR)/jabber/protocol/iq/OOB.cs \
$(BASEDIR)/jabber/protocol/iq/Auth.cs \
$(BASEDIR)/jabber/protocol/iq/Register.cs \
$(BASEDIR)/jabber/protocol/iq/Roster.cs \
$(BASEDIR)/jabber/protocol/iq/Last.cs \
$(BASEDIR)/jabber/protocol/iq/Browse.cs \
$(BASEDIR)/jabber/protocol/iq/Factory.cs \
$(BASEDIR)/jabber/protocol/iq/Agents.cs \
$(BASEDIR)/jabber/protocol/iq/Time.cs \
$(BASEDIR)/jabber/protocol/iq/Version.cs \
$(BASEDIR)/jabber/protocol/iq/Disco.cs \
$(BASEDIR)/jabber/protocol/ElementStream.cs \
$(BASEDIR)/jabber/protocol/XmlLoader.cs \
$(BASEDIR)/jabber/protocol/ElementFactory.cs \
$(BASEDIR)/jabber/protocol/URI.cs \
$(BASEDIR)/jabber/protocol/AsynchElementStream.cs \
$(BASEDIR)/jabber/protocol/accept/Log.cs \
$(BASEDIR)/jabber/protocol/accept/Xdb.cs \
$(BASEDIR)/jabber/protocol/accept/Route.cs \
$(BASEDIR)/jabber/protocol/accept/Factory.cs \
$(BASEDIR)/jabber/protocol/accept/Handshake.cs \
$(BASEDIR)/jabber/protocol/Packet.cs \
$(BASEDIR)/jabber/protocol/client/IQ.cs \
$(BASEDIR)/jabber/protocol/client/ProtocolException.cs \
$(BASEDIR)/jabber/protocol/client/Factory.cs \
$(BASEDIR)/jabber/protocol/client/Presence.cs \
$(BASEDIR)/jabber/protocol/client/Error.cs \
$(BASEDIR)/jabber/protocol/client/Message.cs \
$(BASEDIR)/jabber/protocol/ElementList.cs \
$(BASEDIR)/jabber/protocol/stream/Features.cs \
$(BASEDIR)/jabber/protocol/stream/SASL.cs \
$(BASEDIR)/jabber/protocol/stream/Bind.cs \
$(BASEDIR)/jabber/protocol/stream/StartTLS.cs \
$(BASEDIR)/jabber/protocol/stream/Factory.cs \
$(BASEDIR)/jabber/protocol/stream/Session.cs \
$(BASEDIR)/jabber/protocol/stream/Stream.cs \
$(BASEDIR)/jabber/protocol/stream/Error.cs \
$(BASEDIR)/jabber/protocol/Element.cs \
$(BASEDIR)/jabber/protocol/SynchElementStream.cs \
$(BASEDIR)/bedrock/io/ReadEventStream.cs \
$(BASEDIR)/bedrock/io/PipeStream.cs \
$(BASEDIR)/bedrock/net/AsyncSocket.cs \
$(BASEDIR)/bedrock/net/Socks4Proxy.cs \
$(BASEDIR)/bedrock/net/SocketEventListener.cs \
$(BASEDIR)/bedrock/net/Address.cs \
$(BASEDIR)/bedrock/net/SocketWatcher.cs \
$(BASEDIR)/bedrock/net/ShttpProxy.cs \
$(BASEDIR)/bedrock/net/JEP25Socket.cs \
$(BASEDIR)/bedrock/net/Socks5Proxy.cs \
$(BASEDIR)/bedrock/net/BaseSocket.cs \
$(BASEDIR)/bedrock/net/ProxySocket.cs \
$(BASEDIR)/bedrock/net/CertUtil.cs \
$(BASEDIR)/bedrock/util/GetOptBase.cs \
$(BASEDIR)/bedrock/util/ConfigFile.cs \
$(BASEDIR)/bedrock/util/Version.cs \
$(BASEDIR)/bedrock/Delegates.cs \
$(BASEDIR)/bedrock/collections/SkipList.cs \
$(BASEDIR)/bedrock/collections/Set.cs \
$(BASEDIR)/bedrock/collections/TrieNode.cs \
$(BASEDIR)/bedrock/collections/ByteStack.cs \
$(BASEDIR)/bedrock/collections/IndexedTrie.cs \
$(BASEDIR)/bedrock/collections/LinkedList.cs \
$(BASEDIR)/bedrock/collections/GraphNode.cs \
$(BASEDIR)/bedrock/collections/ISet.cs \
$(BASEDIR)/bedrock/collections/Tree.cs \
$(BASEDIR)/bedrock/collections/Trie.cs 

RESOURCES = \
-resource:$(BASEDIR)/jabber/client/JabberClient.resx \
-resource:$(BASEDIR)/jabber/client/RosterManager.resx \
-resource:$(BASEDIR)/jabber/connection/SocketElementStream.resx \
-resource:$(BASEDIR)/jabber/server/JabberService.resx \
-resource:$(BASEDIR)/jabber/client/JabberClient.bmp \
-resource:$(BASEDIR)/jabber/client/PresenceManager.bmp \
-resource:$(BASEDIR)/jabber/client/RosterManager.bmp \
-resource:$(BASEDIR)/jabber/server/JabberService.bmp

SYSTEM_REFERENCES = -r:System.dll -r:System.Data.dll -r:System.Xml.dll \
-r:System.Windows.Forms.dll -r:System.Drawing.dll 

MCS_OPTIONS = -lib:$(BASEDIR)/bin/debug -g -define:NO_STRINGPREP -define:NO_SSL

ASSEMBLIES = -r:$(BASEDIR)/lib/AElfred.dll -r:$(BASEDIR)/lib/SAX.dll

all: jabber-net.dll

jabber-net.dll: $(SOURCES)
	-mkdir -p bin/debug
	cd bin/debug && mcs $(MCS_OPTIONS) -target:library \
	-out:"jabber-net.dll" $(RESOURCES) $(SYSTEM_REFERENCES) \
	$(SOURCES) $(ASSEMBLIES) 

clean:
	rm -rf bin