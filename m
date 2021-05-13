Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B706E37F5E0
	for <lists+linux-cachefs@lfdr.de>; Thu, 13 May 2021 12:49:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620902996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QCMXsc0Hb416UjiUl80y0vmeqyO1JKrvBgg6TT9STgg=;
	b=B9IlvFbxJlDXETtJrJrcmbGmTcQ23DCkcln4xXp6t+mwEzHqV65xDHxfq/8eKALZY7Dl2b
	+4YNm6NyZyBOAAOvtwCK9HWmUPkkp+M0AW9P2dCwFJeSPDp/LlOAaYO0YqVXXkkZrPcKKc
	wDNLfOsrPzSBez2pwVbs91PunihOlcE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-i-I_EVVoNEiCcnUJd-AsFg-1; Thu, 13 May 2021 06:49:55 -0400
X-MC-Unique: i-I_EVVoNEiCcnUJd-AsFg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B933364159;
	Thu, 13 May 2021 10:49:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A9E310016F9;
	Thu, 13 May 2021 10:49:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2786E55342;
	Thu, 13 May 2021 10:49:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14DAnlbM030831 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 13 May 2021 06:49:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 65AD05C290; Thu, 13 May 2021 10:49:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2374B1B058;
	Thu, 13 May 2021 10:49:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: geert@linux-m68k.org
Date: Thu, 13 May 2021 11:49:41 +0100
Message-ID: <162090298141.3166007.2971118149366779916.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH] netfs: Make CONFIG_NETFS_SUPPORT
 auto-selected rather than manual
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make the netfs helper library selected automatically by the things that use
it rather than being manually configured, even though it's required.

Fixes: 3a5829fefd3b ("netfs: Make a netfs helper module")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-mm@kvack.org
cc: linux-cachefs@redhat.com
cc: linux-afs@lists.infradead.org
cc: linux-nfs@vger.kernel.org
cc: linux-cifs@vger.kernel.org
cc: ceph-devel@vger.kernel.org
cc: v9fs-developer@lists.sourceforge.net
cc: linux-fsdevel@vger.kernel.org
Link: https://lore.kernel.org/r/CAMuHMdXJZ7iNQE964CdBOU=vRKVMFzo=YF_eiwsGgqzuvZ+TuA@mail.gmail.com
---

 fs/netfs/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/netfs/Kconfig b/fs/netfs/Kconfig
index 578112713703..b4db21022cb4 100644
--- a/fs/netfs/Kconfig
+++ b/fs/netfs/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 config NETFS_SUPPORT
-	tristate "Support for network filesystem high-level I/O"
+	tristate
 	help
 	  This option enables support for network filesystems, including
 	  helpers for high-level buffered I/O, abstracting out read


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

