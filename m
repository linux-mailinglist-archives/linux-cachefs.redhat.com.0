Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2B66329893C
	for <lists+linux-cachefs@lfdr.de>; Mon, 26 Oct 2020 10:13:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603703614;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Wz2dW4r3DAnqLTS39ZxcZd2WT8qG41wLh4hX29WMpok=;
	b=Dya9361PKR0Lf0i84vMW9lK1mf/T/AdPoZnC+yx08SYkPWHLp1R6W+Vf+1nnaV00qGda9m
	1qAvRUFPCVrLv3FaGy/naoFP5fb8p/o3j8exPBLxxNDhfgjrv1Z0UoVXYm6Y7p4T2i9gQb
	aW6vbvBDnoeHx/+uNCFsoj1+xz4yMkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-3FTx9XunPkegmLBXXe_vIA-1; Mon, 26 Oct 2020 05:13:31 -0400
X-MC-Unique: 3FTx9XunPkegmLBXXe_vIA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D5751099F63;
	Mon, 26 Oct 2020 09:13:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 896561002388;
	Mon, 26 Oct 2020 09:13:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89D2692F22;
	Mon, 26 Oct 2020 09:13:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09Q9CFAn032632 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 26 Oct 2020 05:12:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D97B25C1C5; Mon, 26 Oct 2020 09:12:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-120-70.rdu2.redhat.com
	[10.10.120.70])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63D605C1C2;
	Mon, 26 Oct 2020 09:12:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
Date: Mon, 26 Oct 2020 09:12:10 +0000
Message-ID: <160370353064.1014444.12358832243259407276.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-cachefs@redhat.com, stable@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH] cachefiles: Handle readpage error correctly
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
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

From: Matthew Wilcox (Oracle) <willy@infradead.org>

If ->readpage returns an error, it has already unlocked the page.

Fixes: 5e929b33c393 ("CacheFiles: Handle truncate unlocking the page we're reading")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/cachefiles/rdwr.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/cachefiles/rdwr.c b/fs/cachefiles/rdwr.c
index 5b4cee71fa32..e027c718ca01 100644
--- a/fs/cachefiles/rdwr.c
+++ b/fs/cachefiles/rdwr.c
@@ -121,7 +121,7 @@ static int cachefiles_read_reissue(struct cachefiles_object *object,
 		_debug("reissue read");
 		ret = bmapping->a_ops->readpage(NULL, backpage);
 		if (ret < 0)
-			goto unlock_discard;
+			goto discard;
 	}
 
 	/* but the page may have been read before the monitor was installed, so
@@ -138,6 +138,7 @@ static int cachefiles_read_reissue(struct cachefiles_object *object,
 
 unlock_discard:
 	unlock_page(backpage);
+discard:
 	spin_lock_irq(&object->work_lock);
 	list_del(&monitor->op_link);
 	spin_unlock_irq(&object->work_lock);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

