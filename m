Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1866D24A5
	for <lists+linux-cachefs@lfdr.de>; Fri, 31 Mar 2023 18:09:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680278970;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fTIz8fiLg+9cJoCbECjVUrDI+jPFzx6V6fWbA9UGUm4=;
	b=h7VPyYY6N5k8+AjURO8W07nh+hUIX/iMKcoWG4PUknQzt7Rfenk8wqxB94RIxyPMTCTYyc
	H7/Eanq+3CxwEAxSilGYMvhsEPQa+A2kratRNsXYWLf4yUCBMIXIcTzRM2cIKLZp5275U9
	cZjFfmfA8rao5S4JIAX5/CRIWAbKMLI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-SeXCdWg9Pr6UCGG5Y4YNmA-1; Fri, 31 Mar 2023 12:09:29 -0400
X-MC-Unique: SeXCdWg9Pr6UCGG5Y4YNmA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 458D53C1178D;
	Fri, 31 Mar 2023 16:09:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B2D2C15BA0;
	Fri, 31 Mar 2023 16:09:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CE5431946A40;
	Fri, 31 Mar 2023 16:09:25 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 74D0219465BC for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 31 Mar 2023 16:09:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 591414042AC7; Fri, 31 Mar 2023 16:09:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF52D4042AC0;
 Fri, 31 Mar 2023 16:09:21 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Matthew Wilcox <willy@infradead.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Date: Fri, 31 Mar 2023 17:08:20 +0100
Message-Id: <20230331160914.1608208-2-dhowells@redhat.com>
In-Reply-To: <20230331160914.1608208-1-dhowells@redhat.com>
References: <20230331160914.1608208-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Linux-cachefs] [PATCH v3 01/55] netfs: Fix
 netfs_extract_iter_to_sg() for ITER_UBUF/IOVEC
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
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
 Christian Brauner <brauner@kernel.org>, linux-cachefs@redhat.com,
 linux-cifs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 netdev@vger.kernel.org, Steve French <sfrench@samba.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Chuck Lever III <chuck.lever@oracle.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Shyam Prasad N <nspmangalore@gmail.com>,
 linux-fsdevel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix netfs_extract_iter_to_sg() for ITER_UBUF and ITER_IOVEC to set the size
of the page to the part of the page extracted, not the remaining amount of
data in the extracted page array at that point.

This doesn't yet affect anything as cifs, the only current user, only
passes in non-user-backed iterators.

Fixes: 018584697533 ("netfs: Add a function to extract an iterator into a scatterlist")
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: linux-cachefs@redhat.com
cc: linux-cifs@vger.kernel.org
cc: linux-fsdevel@vger.kernel.org
---
 fs/netfs/iterator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/netfs/iterator.c b/fs/netfs/iterator.c
index e9a45dea748a..8a4c86687429 100644
--- a/fs/netfs/iterator.c
+++ b/fs/netfs/iterator.c
@@ -139,7 +139,7 @@ static ssize_t netfs_extract_user_to_sg(struct iov_iter *iter,
 			size_t seg = min_t(size_t, PAGE_SIZE - off, len);
 
 			*pages++ = NULL;
-			sg_set_page(sg, page, len, off);
+			sg_set_page(sg, page, seg, off);
 			sgtable->nents++;
 			sg++;
 			len -= seg;
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

