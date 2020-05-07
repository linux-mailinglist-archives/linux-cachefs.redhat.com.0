Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD581CBA3C
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 May 2020 23:54:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588974893;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GdA0Sx46CJYSi3OzYo/Ngz0z25rcIEe6U2gWnVd0TH0=;
	b=cxZS++8luXzrV/l3hgmhXfstxsDaCs5z0KxWW8kPPJzhbSd8eIgnDDAQqy5f1ZQv76P4fs
	k3yS6DbuZwfvZugkUtIUYgg3A2qC08oSa8neR+tlm4UgYeQWGOae9JLIy9lE5wU4wd19Du
	H/T6fquGuzjOJzd5MvApqLZUUBHYPhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-YHvn6r_wPTGO5nb4obrpEw-1; Fri, 08 May 2020 17:54:50 -0400
X-MC-Unique: YHvn6r_wPTGO5nb4obrpEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C954872FE0;
	Fri,  8 May 2020 21:54:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 610A95D9CC;
	Fri,  8 May 2020 21:54:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3EAAD4CAA0;
	Fri,  8 May 2020 21:54:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 047IwgcS016772 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 14:58:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C69E2156A2E; Thu,  7 May 2020 18:58:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 082692157F26
	for <linux-cachefs@redhat.com>; Thu,  7 May 2020 18:58:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8387811E77
	for <linux-cachefs@redhat.com>; Thu,  7 May 2020 18:58:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-467-IIyQ12VSPBiQQrenteIBsg-1;
	Thu, 07 May 2020 14:58:34 -0400
X-MC-Unique: IIyQ12VSPBiQQrenteIBsg-1
Received: from embeddedor (unknown [189.207.59.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7608D21BE5;
	Thu,  7 May 2020 18:48:40 +0000 (UTC)
Date: Thu, 7 May 2020 13:53:07 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20200507185307.GA14353@embeddedor>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 047IwgcS016772
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 08 May 2020 17:54:46 -0400
Cc: linux-cachefs@redhat.com, linux-kernel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH] FS-Cache: Replace zero-length array with
	flexible-array
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

sizeof(flexible-array-member) triggers a warning because flexible array
members have incomplete type[1]. There are some instances of code in
which the sizeof operator is being incorrectly/erroneously applied to
zero-length arrays and the result is zero. Such instances may be hiding
some bugs. So, this work (flexible-array member conversions) will also
help to get completely rid of those sorts of issues.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 include/linux/fscache-cache.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index d5ba431b5d63..5b6072e4a7ab 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -46,7 +46,7 @@ struct fscache_cache_tag {
 	unsigned long		flags;
 #define FSCACHE_TAG_RESERVED	0		/* T if tag is reserved for a cache */
 	atomic_t		usage;
-	char			name[0];	/* tag name */
+	char			name[];	/* tag name */
 };
 
 /*


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

