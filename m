Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD9C6D2881
	for <lists+linux-cachefs@lfdr.de>; Fri, 31 Mar 2023 21:12:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680289965;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7waT0WarL/UMfIpYsQC0ZrN24wJyJka/LhkZrO1x7Iw=;
	b=amSbUHHIoURCTD41gVokqFUvqKpTRLxQ86BYc+sMAR4HEJjdmmjTy8gBBg6xdcB+NUSlpB
	DketmAPEj6AmrGJSHapcNDCT+AHjSVREflQ1y7BD7Y1UnixXqibarYyMHBpzAzQNg6C90y
	fgzP8uvvuLBz/qokKa1+fRQfb9tcOwA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-GsvGCGdmNja9o2fSAGJbZQ-1; Fri, 31 Mar 2023 15:12:42 -0400
X-MC-Unique: GsvGCGdmNja9o2fSAGJbZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D904811E7C;
	Fri, 31 Mar 2023 19:12:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E4F21121314;
	Fri, 31 Mar 2023 19:12:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3B43D1946A40;
	Fri, 31 Mar 2023 19:12:40 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D10C419465BC for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 31 Mar 2023 19:12:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B1F77202701F; Fri, 31 Mar 2023 19:12:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAA85202701E
 for <linux-cachefs@redhat.com>; Fri, 31 Mar 2023 19:12:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 881173C025D8
 for <linux-cachefs@redhat.com>; Fri, 31 Mar 2023 19:12:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-ocR6l5bFNPemueL50Gb6Zw-1; Fri, 31 Mar 2023 15:12:33 -0400
X-MC-Unique: ocR6l5bFNPemueL50Gb6Zw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA83362B67;
 Fri, 31 Mar 2023 19:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC5DC433D2;
 Fri, 31 Mar 2023 19:05:56 +0000 (UTC)
Message-ID: <a6adab95d955065dd05c78ac462c32dfd146e820.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, Matthew Wilcox
 <willy@infradead.org>,  "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>
Date: Fri, 31 Mar 2023 15:05:55 -0400
In-Reply-To: <20230331160914.1608208-2-dhowells@redhat.com>
References: <20230331160914.1608208-1-dhowells@redhat.com>
 <20230331160914.1608208-2-dhowells@redhat.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Linux-cachefs] [PATCH v3 01/55] netfs: Fix
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
Cc: Jens Axboe <axboe@kernel.dk>, Steve French <sfrench@samba.org>,
 Christian Brauner <brauner@kernel.org>, linux-cachefs@redhat.com,
 linux-cifs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Chuck Lever III <chuck.lever@oracle.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Shyam Prasad N <nspmangalore@gmail.com>, linux-fsdevel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2023-03-31 at 17:08 +0100, David Howells wrote:
> Fix netfs_extract_iter_to_sg() for ITER_UBUF and ITER_IOVEC to set the size
> of the page to the part of the page extracted, not the remaining amount of
> data in the extracted page array at that point.
> 
> This doesn't yet affect anything as cifs, the only current user, only
> passes in non-user-backed iterators.
> 
> Fixes: 018584697533 ("netfs: Add a function to extract an iterator into a scatterlist")
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: Steve French <sfrench@samba.org>
> cc: Shyam Prasad N <nspmangalore@gmail.com>
> cc: Rohith Surabattula <rohiths.msft@gmail.com>
> cc: linux-cachefs@redhat.com
> cc: linux-cifs@vger.kernel.org
> cc: linux-fsdevel@vger.kernel.org
> ---
>  fs/netfs/iterator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/netfs/iterator.c b/fs/netfs/iterator.c
> index e9a45dea748a..8a4c86687429 100644
> --- a/fs/netfs/iterator.c
> +++ b/fs/netfs/iterator.c
> @@ -139,7 +139,7 @@ static ssize_t netfs_extract_user_to_sg(struct iov_iter *iter,
>  			size_t seg = min_t(size_t, PAGE_SIZE - off, len);
>  
>  			*pages++ = NULL;
> -			sg_set_page(sg, page, len, off);
> +			sg_set_page(sg, page, seg, off);
>  			sgtable->nents++;
>  			sg++;
>  			len -= seg;
> 

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

