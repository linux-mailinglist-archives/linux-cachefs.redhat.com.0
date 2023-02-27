Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6C06A4231
	for <lists+linux-cachefs@lfdr.de>; Mon, 27 Feb 2023 14:05:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677503109;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V8I8fbCv7EVPOV9c+4q6mqdb87RFhsqXl5vnCeEl3po=;
	b=cB39z/UWMckCVj6ypVKTy3hNH56qfSJ4H+ngBJOzTZuboCoBmESOpjZIsdvVsHye322XUH
	VCR4xc2x1EUkHlRhP+VXgBn0Ny44fMrElT1O3Z43OvAwmOOs6kO5NFUFfrk7y9WsPPb9YC
	6S30xnwNw5QPtVJ7KEM8nIwx0vbDvCU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-ruC4IQx1Md2_ko7YD1P3Iw-1; Mon, 27 Feb 2023 08:05:06 -0500
X-MC-Unique: ruC4IQx1Md2_ko7YD1P3Iw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7963857A8E;
	Mon, 27 Feb 2023 13:05:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B031C15BAD;
	Mon, 27 Feb 2023 13:05:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 04F001946594;
	Mon, 27 Feb 2023 13:05:05 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2B35F1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 27 Feb 2023 13:05:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 14CE1422A9; Mon, 27 Feb 2023 13:05:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 752E618EC7;
 Mon, 27 Feb 2023 13:05:01 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Steve French <smfrench@gmail.com>
Date: Mon, 27 Feb 2023 13:04:54 +0000
Message-Id: <20230227130454.2673622-3-dhowells@redhat.com>
In-Reply-To: <20230227130454.2673622-1-dhowells@redhat.com>
References: <20230227130454.2673622-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Linux-cachefs] [PATCH 2/2] iov: Fix netfs_extract_user_to_sg()
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Tom Talpey <tom@talpey.com>,
 Stefan Metzmacher <metze@samba.org>, kernel test robot <lkp@intel.com>,
 linux-cifs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
 Dan Carpenter <error27@gmail.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix the loop check in netfs_extract_user_to_sg() for extraction from
user-backed iterators to do the body if npages > 0, not if npages < 0
(which it can never be).

This isn't currently used by cifs, which only ever extracts data from BVEC,
KVEC and XARRAY iterators at this level, user-backed iterators having being
decanted into BVEC iterators at a higher level to accommodate the work
being done in a kernel thread.

Found by smatch:
	fs/netfs/iterator.c:139 netfs_extract_user_to_sg() warn: unsigned 'npages' is never less than zero.

Fixes: 018584697533 ("netfs: Add a function to extract an iterator into a scatterlist")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cifs@vger.kernel.org
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/oe-kbuild-all/202302261115.P3TQi1ZO-lkp@intel.com/
---
 fs/netfs/iterator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/netfs/iterator.c b/fs/netfs/iterator.c
index f00d43b8ac0a..e9a45dea748a 100644
--- a/fs/netfs/iterator.c
+++ b/fs/netfs/iterator.c
@@ -134,7 +134,7 @@ static ssize_t netfs_extract_user_to_sg(struct iov_iter *iter,
 		npages = DIV_ROUND_UP(off + len, PAGE_SIZE);
 		sg_max -= npages;
 
-		for (; npages < 0; npages--) {
+		for (; npages > 0; npages--) {
 			struct page *page = *pages;
 			size_t seg = min_t(size_t, PAGE_SIZE - off, len);
 
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

