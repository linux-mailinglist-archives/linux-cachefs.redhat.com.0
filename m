Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F9E5474A9
	for <lists+linux-cachefs@lfdr.de>; Sat, 11 Jun 2022 14:56:39 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-I3bHqdClNkWVUDFR3yia5A-1; Sat, 11 Jun 2022 08:56:35 -0400
X-MC-Unique: I3bHqdClNkWVUDFR3yia5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1402185A794;
	Sat, 11 Jun 2022 12:56:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E740F1731B;
	Sat, 11 Jun 2022 12:56:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AB923194705B;
	Sat, 11 Jun 2022 12:56:34 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 70AA71947054 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 11 Jun 2022 12:56:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4DF8A1131A; Sat, 11 Jun 2022 12:56:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49FF11731B
 for <linux-cachefs@redhat.com>; Sat, 11 Jun 2022 12:56:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F9063810D3C
 for <linux-cachefs@redhat.com>; Sat, 11 Jun 2022 12:56:33 +0000 (UTC)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk
 [142.44.231.140]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-09hvaLLGO1-ZB51IvY6nlQ-1; Sat, 11 Jun 2022 08:56:29 -0400
X-MC-Unique: 09hvaLLGO1-ZB51IvY6nlQ-1
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o00fD-0066DC-RO; Sat, 11 Jun 2022 12:56:27 +0000
Date: Sat, 11 Jun 2022 12:56:27 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Message-ID: <YqSQ++8UnEW0AJ2y@zeniv-ca.linux.org.uk>
References: <YqRyL2sIqQNDfky2@debian> <YqSGv6uaZzLxKfmG@zeniv-ca.linux.org.uk>
 <YqSMmC/UuQpXdxtR@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
In-Reply-To: <YqSMmC/UuQpXdxtR@zeniv-ca.linux.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Linux-cachefs] mainline build failure due to 6c77676645ad
 ("iov_iter: Fix iter_xarray_get_pages{, _alloc}()")
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, Gao Xiang <xiang@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-afs@lists.infradead.org,
 devel@lists.orangefs.org, Mike Marshall <hubcap@omnibond.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 11, 2022 at 12:37:44PM +0000, Al Viro wrote:
> On Sat, Jun 11, 2022 at 12:12:47PM +0000, Al Viro wrote:
> 
> 
> > At a guess, should be
> > 	return min((size_t)nr * PAGE_SIZE - offset, maxsize);
> > 
> > in both places.  I'm more than half-asleep right now; could you verify that it
> > (as the last lines of both iter_xarray_get_pages() and iter_xarray_get_pages_alloc())
> > builds correctly?
> 
> No, I'm misreading it - it's unsigned * unsigned long - unsigned vs. size_t.
> On arm it ends up with unsigned long vs. unsigned int; functionally it *is*
> OK (both have the same range there), but it triggers the tests.  Try 
> 
> 	return min_t(size_t, nr * PAGE_SIZE - offset, maxsize);
> 
> there (both places).

The reason we can't overflow on multiplication there, BTW, is that we have
nr <= count, and count has come from weirdly open-coded
	DIV_ROUND_UP(size + offset, PAGE_SIZE)
IMO we'd better make it explicit, so how about the following:

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index dda6d5f481c1..150dbd314d25 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -1445,15 +1445,7 @@ static ssize_t iter_xarray_get_pages(struct iov_iter *i,
 	offset = pos & ~PAGE_MASK;
 	*_start_offset = offset;
 
-	count = 1;
-	if (size > PAGE_SIZE - offset) {
-		size -= PAGE_SIZE - offset;
-		count += size >> PAGE_SHIFT;
-		size &= ~PAGE_MASK;
-		if (size)
-			count++;
-	}
-
+	count = DIV_ROUND_UP(size + offset, PAGE_SIZE);
 	if (count > maxpages)
 		count = maxpages;
 
@@ -1461,7 +1453,7 @@ static ssize_t iter_xarray_get_pages(struct iov_iter *i,
 	if (nr == 0)
 		return 0;
 
-	return min(nr * PAGE_SIZE - offset, maxsize);
+	return min_t(size_t, nr * PAGE_SIZE - offset, maxsize);
 }
 
 /* must be done on non-empty ITER_IOVEC one */
@@ -1607,15 +1599,7 @@ static ssize_t iter_xarray_get_pages_alloc(struct iov_iter *i,
 	offset = pos & ~PAGE_MASK;
 	*_start_offset = offset;
 
-	count = 1;
-	if (size > PAGE_SIZE - offset) {
-		size -= PAGE_SIZE - offset;
-		count += size >> PAGE_SHIFT;
-		size &= ~PAGE_MASK;
-		if (size)
-			count++;
-	}
-
+	count = DIV_ROUND_UP(size + offset, PAGE_SIZE);
 	p = get_pages_array(count);
 	if (!p)
 		return -ENOMEM;
@@ -1625,7 +1609,7 @@ static ssize_t iter_xarray_get_pages_alloc(struct iov_iter *i,
 	if (nr == 0)
 		return 0;
 
-	return min(nr * PAGE_SIZE - offset, maxsize);
+	return min_t(size_t, nr * PAGE_SIZE - offset, maxsize);
 }
 
 ssize_t iov_iter_get_pages_alloc(struct iov_iter *i,

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

