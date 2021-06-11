Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 20BF13A4621
	for <lists+linux-cachefs@lfdr.de>; Fri, 11 Jun 2021 18:04:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-gwZAjewLMxmOrIRPgKdc7Q-1; Fri, 11 Jun 2021 12:04:43 -0400
X-MC-Unique: gwZAjewLMxmOrIRPgKdc7Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A0C58030A0;
	Fri, 11 Jun 2021 16:04:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8E446064B;
	Fri, 11 Jun 2021 16:04:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A37161809CAD;
	Fri, 11 Jun 2021 16:04:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15BFwoJp014816 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 11 Jun 2021 11:58:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 215B51055233; Fri, 11 Jun 2021 15:58:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C7CC10551B1
	for <linux-cachefs@redhat.com>; Fri, 11 Jun 2021 15:58:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC44F919823
	for <linux-cachefs@redhat.com>; Fri, 11 Jun 2021 15:58:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-16-yz4_a6S_Py6LLcIOoCZYkw-1; 
	Fri, 11 Jun 2021 11:58:43 -0400
X-MC-Unique: yz4_a6S_Py6LLcIOoCZYkw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA793613EA;
	Fri, 11 Jun 2021 15:58:41 +0000 (UTC)
Message-ID: <44c35af5cc83b5c01fd55c7be6c0c16dd03cea2b.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 11 Jun 2021 11:58:40 -0400
In-Reply-To: <20210611155509.76691-1-jlayton@kernel.org>
References: <20210611155509.76691-1-jlayton@kernel.org>
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: pfmeec@rit.edu, linux-cachefs@redhat.com, Andrew W Elble <aweits@rit.edu>,
	willy@infradead.org
Subject: Re: [Linux-cachefs] [RFC PATCH] ceph: fix write_begin optimization
 when write is beyond EOF
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-06-11 at 11:55 -0400, Jeff Layton wrote:
> It's not sufficient to skip reading when the pos is beyond the EOF.
> There may be data at the head of the page that we need to fill in
> before the write. Only elide the read if the pos is beyond the last page
> in the file.
> 
> Reported-by: Andrew W Elble <aweits@rit.edu>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/ceph/addr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> I've not tested this at all yet, but I think this is probably what we'll
> want for stable series v5.10.z - v5.12.z.
> 
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 35c83f65475b..9f60f541b423 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -1353,11 +1353,11 @@ static int ceph_write_begin(struct file *file, struct address_space *mapping,
>  		/*
>  		 * In some cases we don't need to read at all:
>  		 * - full page write
> -		 * - write that lies completely beyond EOF
> +		 * - write that lies in a page that is completely beyond EOF
>  		 * - write that covers the the page from start to EOF or beyond it
>  		 */
>  		if ((pos_in_page == 0 && len == PAGE_SIZE) ||
> -		    (pos >= i_size_read(inode)) ||
> +		    (index >= (i_size_read(inode) << PAGE_SHIFT)) ||

...and this should be:

		(index > (i_size_read(inode) << PAGE_SHIFT)) ||
			
We only get to skip the read if the write pos is _beyond_ the last page.

>  		    (pos_in_page == 0 && (pos + len) >= i_size_read(inode))) {
>  			zero_user_segments(page, 0, pos_in_page,
>  					   pos_in_page + len, PAGE_SIZE);

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

