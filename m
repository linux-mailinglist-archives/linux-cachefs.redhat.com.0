Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCDF4CBE3F
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Mar 2022 13:57:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-MnOZbmjaPQeqyoyC1Jx0qg-1; Thu, 03 Mar 2022 07:57:00 -0500
X-MC-Unique: MnOZbmjaPQeqyoyC1Jx0qg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B816824FA7;
	Thu,  3 Mar 2022 12:56:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA9C683BEB;
	Thu,  3 Mar 2022 12:56:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E47B34A701;
	Thu,  3 Mar 2022 12:56:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 223CupGp016961 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Mar 2022 07:56:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DE92F2166BB1; Thu,  3 Mar 2022 12:56:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA1292166B1F
	for <linux-cachefs@redhat.com>; Thu,  3 Mar 2022 12:56:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9798B811E75
	for <linux-cachefs@redhat.com>; Thu,  3 Mar 2022 12:56:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
	[139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-362-DjNwpE8QMvytnJtWRl7VdA-1; Thu, 03 Mar 2022 07:56:46 -0500
X-MC-Unique: DjNwpE8QMvytnJtWRl7VdA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A5DD61984;
	Thu,  3 Mar 2022 12:51:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5767FC004E1;
	Thu,  3 Mar 2022 12:51:35 +0000 (UTC)
Message-ID: <ca84ca91f1114bb9d8d0de29a00ac8a631caf5b2.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>
Date: Thu, 03 Mar 2022 07:51:33 -0500
In-Reply-To: <164630854858.3665356.17419701804248490708.stgit@warthog.procyon.org.uk>
References: <164630854858.3665356.17419701804248490708.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: Fix incorrect length to
	fallocate()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2022-03-03 at 11:55 +0000, David Howells wrote:
> When cachefiles_shorten_object() calls fallocate() to shape the cache file
> to match the DIO size, it passes the total file size it wants to achieve,
> not the amount of zeros that should be inserted.  Since this is meant to
> preallocate that amount of storage for the file, it can cause the cache to
> fill up the disk and hit ENOSPC.
> 
> Fix this by passing the length actually required to go from the current EOF
> to the desired EOF.
> 
> Fixes: 7623ed6772de ("cachefiles: Implement cookie resize for truncate")
> Reported-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-cachefs@redhat.com
> ---
> 
>  fs/cachefiles/interface.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
> index 51c968cd00a6..ae93cee9d25d 100644
> --- a/fs/cachefiles/interface.c
> +++ b/fs/cachefiles/interface.c
> @@ -254,7 +254,7 @@ static bool cachefiles_shorten_object(struct cachefiles_object *object,
>  		ret = cachefiles_inject_write_error();
>  		if (ret == 0)
>  			ret = vfs_fallocate(file, FALLOC_FL_ZERO_RANGE,
> -					    new_size, dio_size);
> +					    new_size, dio_size - new_size);
>  		if (ret < 0) {
>  			trace_cachefiles_io_error(object, file_inode(file), ret,
>  						  cachefiles_trace_fallocate_error);
> 
> 

Looks good!

I could often force the cache to fill up with the right fsstress run on
ceph, but with this in place I'm on the 5th run of xfstest generic/013
and it hasn't happened yet. You can add these if you like:

Tested-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

