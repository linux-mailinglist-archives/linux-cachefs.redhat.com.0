Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id BEF95346D0B
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Mar 2021 23:30:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616538612;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pm2UJis7Pj4fmnX1cHa9TjYB/xJRiJOC7MZGE2epa4A=;
	b=NbeqkNtceeWhb5ZGw7XheO2pS4xJx5bVkfkOc6eRTU+vlAtqo8JIY2/Kgj8AyGANfKWQnM
	lDzAN8BFfLF/P5rpYu1x8l9sitUuK+T4AKuoZyXFICoZSGBMzgxUFfRxy0+PajatR8O4KY
	nsxWLmpbypQM3wKE6rv98mlve2syyeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-aAwtRrD6OQ26TLAOoO8xng-1; Tue, 23 Mar 2021 18:30:11 -0400
X-MC-Unique: aAwtRrD6OQ26TLAOoO8xng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16FFF87A83C;
	Tue, 23 Mar 2021 22:30:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04EE75C26D;
	Tue, 23 Mar 2021 22:30:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DDB3E180C5A8;
	Tue, 23 Mar 2021 22:30:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NMIWU2025084 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 18:18:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 73AFA5C1CF; Tue, 23 Mar 2021 22:18:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-58.rdu2.redhat.com
	[10.10.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F5205C1C5;
	Tue, 23 Mar 2021 22:18:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Tue, 23 Mar 2021 22:18:23 +0000
Message-ID: <161653790328.2770958.6710423217716151549.stgit@warthog.procyon.org.uk>
In-Reply-To: <161653784755.2770958.11820491619308713741.stgit@warthog.procyon.org.uk>
References: <161653784755.2770958.11820491619308713741.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 23 Mar 2021 18:29:55 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH v5 05/28] netfs: Make a netfs helper module
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make a netfs helper module to manage read request segmentation, caching
support and transparent huge page support on behalf of a network
filesystem.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@redhat.com>
cc: Matthew Wilcox <willy@infradead.org>
cc: linux-mm@kvack.org
cc: linux-cachefs@redhat.com
cc: linux-afs@lists.infradead.org
cc: linux-nfs@vger.kernel.org
cc: linux-cifs@vger.kernel.org
cc: ceph-devel@vger.kernel.org
cc: v9fs-developer@lists.sourceforge.net
cc: linux-fsdevel@vger.kernel.org
Link: https://lore.kernel.org/r/160588496284.3465195.10102643717770106661.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/161118135638.1232039.1622182202673126285.stgit@warthog.procyon.org.uk/ # rfc
Link: https://lore.kernel.org/r/161161031028.2537118.1213974428943508753.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/161340391427.1303470.14884950716721956560.stgit@warthog.procyon.org.uk/ # v3
Link: https://lore.kernel.org/r/161539531569.286939.18317119181653706665.stgit@warthog.procyon.org.uk/ # v4
---

 fs/netfs/Kconfig |    8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 fs/netfs/Kconfig

diff --git a/fs/netfs/Kconfig b/fs/netfs/Kconfig
new file mode 100644
index 000000000000..2ebf90e6ca95
--- /dev/null
+++ b/fs/netfs/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config NETFS_SUPPORT
+	tristate "Support for network filesystem high-level I/O"
+	help
+	  This option enables support for network filesystems, including
+	  helpers for high-level buffered I/O, abstracting out read
+	  segmentation, local caching and transparent huge page support.


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

