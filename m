Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 660B83EB5DE
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Aug 2021 14:58:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-n4RY8GifNWSbujIYd71mCA-1; Fri, 13 Aug 2021 08:58:29 -0400
X-MC-Unique: n4RY8GifNWSbujIYd71mCA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D0051082920;
	Fri, 13 Aug 2021 12:58:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B8BD5C3DF;
	Fri, 13 Aug 2021 12:58:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 73844181A0F1;
	Fri, 13 Aug 2021 12:58:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17DCroTd019953 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 13 Aug 2021 08:53:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF5B111901C; Fri, 13 Aug 2021 12:53:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA9F914E78F
	for <linux-cachefs@redhat.com>; Fri, 13 Aug 2021 12:53:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6349380270A
	for <linux-cachefs@redhat.com>; Fri, 13 Aug 2021 12:53:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-122-oRSAxqegPrePA_Ng9eRUiA-1;
	Fri, 13 Aug 2021 08:53:44 -0400
X-MC-Unique: oRSAxqegPrePA_Ng9eRUiA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 210C560F91;
	Fri, 13 Aug 2021 12:53:42 +0000 (UTC)
Message-ID: <a786d17996459d1ed5530d7f193013c04d183e8c.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Fri, 13 Aug 2021 08:53:41 -0400
In-Reply-To: <162729351325.813557.9242842205308443901.stgit@warthog.procyon.org.uk>
References: <162729351325.813557.9242842205308443901.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH] netfs: Fix READ/WRITE confusion when
 calling iov_iter_xarray()
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

On Mon, 2021-07-26 at 10:58 +0100, David Howells wrote:
> Fix netfs_clear_unread() to pass READ to iov_iter_xarray() instead of WRITE
> (the flag is about the operation accessing the buffer, not what sort of
> access it is doing to the buffer).
> 
> Fixes: 3d3c95046742 ("netfs: Provide readahead and readpage netfs helpers")
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: linux-cachefs@redhat.com
> cc: linux-afs@lists.infradead.org
> cc: ceph-devel@vger.kernel.org
> cc: linux-cifs@vger.kernel.org
> cc: linux-nfs@vger.kernel.org
> cc: v9fs-developer@lists.sourceforge.net
> cc: linux-fsdevel@vger.kernel.org
> cc: linux-mm@kvack.org
> ---
> 
>  fs/netfs/read_helper.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
> index 0b6cd3b8734c..994ec22d4040 100644
> --- a/fs/netfs/read_helper.c
> +++ b/fs/netfs/read_helper.c
> @@ -150,7 +150,7 @@ static void netfs_clear_unread(struct netfs_read_subrequest *subreq)
>  {
>  	struct iov_iter iter;
>  
> -	iov_iter_xarray(&iter, WRITE, &subreq->rreq->mapping->i_pages,
> +	iov_iter_xarray(&iter, READ, &subreq->rreq->mapping->i_pages,
>  			subreq->start + subreq->transferred,
>  			subreq->len   - subreq->transferred);
>  	iov_iter_zero(iov_iter_count(&iter), &iter);
> 
> 

That's better!

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

