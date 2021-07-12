Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 578163C5C14
	for <lists+linux-cachefs@lfdr.de>; Mon, 12 Jul 2021 14:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626092810;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CnH8VthtkNShdqp/Fm/Y22v4/Bs1Xwyoe56rEz9pIGI=;
	b=VhMKffPZNiXW9pFMDV6EawoptEJJ65nDZn1LdksNvuhjbJf0RSYhP6X28SUorKWh9BRpGf
	Jb3RCIRIg3T2ACHUKtW+MnCoQkomWnKVPIUwTCk8/nKKzB0p888EFxNH9F/okgYqnWcDh4
	P0YWs4Z3yb6mkYNR5g8RL4VdKPsskSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-3DFRQQErMRiuShvQVkThNQ-1; Mon, 12 Jul 2021 08:26:49 -0400
X-MC-Unique: 3DFRQQErMRiuShvQVkThNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F71C9F92A;
	Mon, 12 Jul 2021 12:26:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFD9D5C1D1;
	Mon, 12 Jul 2021 12:26:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CF104EA2A;
	Mon, 12 Jul 2021 12:26:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16CCQegP027229 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 12 Jul 2021 08:26:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C61460916; Mon, 12 Jul 2021 12:26:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-19.rdu2.redhat.com
	[10.10.118.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D2E260875;
	Mon, 12 Jul 2021 12:26:33 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Date: Mon, 12 Jul 2021 13:26:32 +0100
Message-ID: <162609279295.3129635.5721010331369998019.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH] netfs: Add MAINTAINERS record
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

Add a MAINTAINERS record for the new netfs helper library.

Signed-off-by: David Howells <dhowells@redhat.com>
Acked-by: Jeff Layton <jlayton@kernel.org>
cc: Matthew Wilcox (Oracle) <willy@infradead.org>
cc: linux-mm@kvack.org
cc: linux-cachefs@redhat.com
cc: linux-afs@lists.infradead.org
cc: linux-nfs@vger.kernel.org
cc: linux-cifs@vger.kernel.org
cc: ceph-devel@vger.kernel.org
cc: v9fs-developer@lists.sourceforge.net
cc: linux-fsdevel@vger.kernel.org
Link: https://lore.kernel.org/r/162377165897.729347.292567369593752239.stgit@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/162377519404.734878.4912821418522385423.stgit@warthog.procyon.org.uk/ # v1
---

 MAINTAINERS |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a61f4f3b78a9..2fd13803cd06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13050,6 +13050,15 @@ NETWORKING [WIRELESS]
 L:	linux-wireless@vger.kernel.org
 Q:	http://patchwork.kernel.org/project/linux-wireless/list/
 
+NETWORK FILESYSTEM HELPER LIBRARY
+M:	David Howells <dhowells@redhat.com>
+M:	Jeff Layton <jlayton@kernel.org>
+L:	linux-cachefs@redhat.com (moderated for non-subscribers)
+S:	Supported
+F:	Documentation/filesystems/netfs_library.rst
+F:	fs/netfs/
+F:	include/linux/netfs.h
+
 NETXEN (1/10) GbE SUPPORT
 M:	Manish Chopra <manishc@marvell.com>
 M:	Rahul Verma <rahulv@marvell.com>


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

