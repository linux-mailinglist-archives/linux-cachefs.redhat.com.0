Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E14A4D91
	for <lists+linux-cachefs@lfdr.de>; Mon, 31 Jan 2022 18:53:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643651591;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JwN8pC1ulch5PzCi3IMq3AsTLQje0q5eOJ34kpOnX3w=;
	b=hgkJ6FMNhN5tCqjHx4jZZVwuM2l5Jvxqk/vtcjshvOCNvl5RjzzPXdFabnY9PUWHJSPSwB
	SLLjzbyfaxMtM9XoqnTC6U4BvuAZrn/wnyCV1F28/QrSCGLJJEVfanPU+J/+Is35VTJBkR
	IKIP2iGfciwgjJFGmEeLiyQOEi3WIjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-amWXMHUGNvSUx7srWXZZlg-1; Mon, 31 Jan 2022 12:53:07 -0500
X-MC-Unique: amWXMHUGNvSUx7srWXZZlg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0999E1091DAA;
	Mon, 31 Jan 2022 17:53:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5F0D838CE;
	Mon, 31 Jan 2022 17:53:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD7DC1809CB8;
	Mon, 31 Jan 2022 17:53:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VHqxI5018781 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 12:52:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D3CCB838CE; Mon, 31 Jan 2022 17:52:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A3D0838D2;
	Mon, 31 Jan 2022 17:52:48 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: smfrench@gmail.com
Date: Mon, 31 Jan 2022 17:52:47 +0000
Message-ID: <164365156782.2040161.8222945480682704501.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH] cachefiles: Fix the volume coherency check
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

Fix the cache volume coherency attribute check.  It was copied from the
file coherency check which uses as struct to lay out the xattr, and so
needs to add a bit on to find the coherency data - but the volume coherency
attribute only contains the coherency data, so we shouldn't be using the
layout struct for it.

This has passed unnoticed so far because it only affects cifs at the
moment, and cifs had its fscache component disabled.

This can now be checked by enabling CONFIG_CIFS_FSCACHE, enabling the
following tracepoint:

	/sys/kernel/debug/tracing/events/cachefiles/cachefiles_vol_coherency/enable

and making a cifs mount.  Without this change, the trace shows a
cachefiles_vol_coherency line with "VOL BAD cmp" in it; with this change it
shows "VOL OK" instead.

Fixes: 32e150037dce ("fscache, cachefiles: Store the volume coherency data")
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: Steve French <smfrench@gmail.com>
cc: linux-cifs@vger.kernel.org
cc: linux-cachefs@redhat.com
---

 fs/cachefiles/xattr.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/cachefiles/xattr.c b/fs/cachefiles/xattr.c
index 83f41bd0c3a9..c6171e818a7c 100644
--- a/fs/cachefiles/xattr.c
+++ b/fs/cachefiles/xattr.c
@@ -218,10 +218,10 @@ bool cachefiles_set_volume_xattr(struct cachefiles_volume *volume)
  */
 int cachefiles_check_volume_xattr(struct cachefiles_volume *volume)
 {
-	struct cachefiles_xattr *buf;
 	struct dentry *dentry = volume->dentry;
 	unsigned int len = volume->vcookie->coherency_len;
 	const void *p = volume->vcookie->coherency;
+	void *buf;
 	enum cachefiles_coherency_trace why;
 	ssize_t xlen;
 	int ret = -ESTALE;
@@ -245,7 +245,7 @@ int cachefiles_check_volume_xattr(struct cachefiles_volume *volume)
 					"Failed to read xattr with error %zd", xlen);
 		}
 		why = cachefiles_coherency_vol_check_xattr;
-	} else if (memcmp(buf->data, p, len) != 0) {
+	} else if (memcmp(buf, p, len) != 0) {
 		why = cachefiles_coherency_vol_check_cmp;
 	} else {
 		why = cachefiles_coherency_vol_check_ok;


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

