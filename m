Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 435C135A558
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 20:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617991872;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FujKDcJS0F9EHwop4+2tlqjdWTEamw1IYRJ3LADaJ4c=;
	b=ihqvDgwTu3HExkHl5nqWWoh++51WMW6X0JxEYCBnFRcUlVWD9/kMG3FoR8TBumRdBEug61
	VMgEjStbzk+xitjevWGsMRE61q4t7gqp5FqY8yC/lv8jdkOFYK2D+q2C/DACB0/SOKYBS7
	CChlNJ4CNISowxR5Rl2KdyhfQcbhfEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-MkeV_63EOYaZoV2nU1LgCg-1; Fri, 09 Apr 2021 14:11:11 -0400
X-MC-Unique: MkeV_63EOYaZoV2nU1LgCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CC58802690;
	Fri,  9 Apr 2021 18:11:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D31B1045E83;
	Fri,  9 Apr 2021 18:11:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47CDB1806D0E;
	Fri,  9 Apr 2021 18:11:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139IB1BF014360 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 14:11:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6A5C41007604; Fri,  9 Apr 2021 18:11:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-35.rdu2.redhat.com
	[10.10.119.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BEDCA10016FD;
	Fri,  9 Apr 2021 18:10:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: viro@zeniv.linux.org.uk
Date: Fri, 09 Apr 2021 19:10:53 +0100
Message-ID: <161799185391.847742.2598422794034740322.stgit@warthog.procyon.org.uk>
In-Reply-To: <YG+s0iw5o91KQIlW@zeniv-ca.linux.org.uk>
References: <YG+s0iw5o91KQIlW@zeniv-ca.linux.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, jlayton@kernel.org,
	linux-kernel@vger.kernel.org, willy@infradead.org,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	hch@lst.de
Subject: [Linux-cachefs] [RFC PATCH 1/2] iov_iter: Remove
	iov_iter_for_each_range()
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

Remove iov_iter_for_each_range() as it's no longer used with the removal of
lustre.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/linux/uio.h |    4 ----
 lib/iov_iter.c      |   27 ---------------------------
 2 files changed, 31 deletions(-)

diff --git a/include/linux/uio.h b/include/linux/uio.h
index 5f5ffc45d4aa..221c256304d4 100644
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@ -295,8 +295,4 @@ ssize_t __import_iovec(int type, const struct iovec __user *uvec,
 int import_single_range(int type, void __user *buf, size_t len,
 		 struct iovec *iov, struct iov_iter *i);
 
-int iov_iter_for_each_range(struct iov_iter *i, size_t bytes,
-			    int (*f)(struct kvec *vec, void *context),
-			    void *context);
-
 #endif
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index f808c625c11e..93e9838c128d 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -2094,30 +2094,3 @@ int import_single_range(int rw, void __user *buf, size_t len,
 	return 0;
 }
 EXPORT_SYMBOL(import_single_range);
-
-int iov_iter_for_each_range(struct iov_iter *i, size_t bytes,
-			    int (*f)(struct kvec *vec, void *context),
-			    void *context)
-{
-	struct kvec w;
-	int err = -EINVAL;
-	if (!bytes)
-		return 0;
-
-	iterate_all_kinds(i, bytes, v, -EINVAL, ({
-		w.iov_base = kmap(v.bv_page) + v.bv_offset;
-		w.iov_len = v.bv_len;
-		err = f(&w, context);
-		kunmap(v.bv_page);
-		err;}), ({
-		w = v;
-		err = f(&w, context);}), ({
-		w.iov_base = kmap(v.bv_page) + v.bv_offset;
-		w.iov_len = v.bv_len;
-		err = f(&w, context);
-		kunmap(v.bv_page);
-		err;})
-	)
-	return err;
-}
-EXPORT_SYMBOL(iov_iter_for_each_range);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

