Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB8079E708
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Sep 2023 13:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694605280;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z4KFxeJ7tegUCmNA/RxDam1tGqG2Lj4PPdPVpTCzTQs=;
	b=BauJrrqYarR0x+fZxgE3IeyuIoxZw10j+5UC4JQ974otbYQDIspXyFGeUhEeTCQi3mUk77
	bB//tKLEsXhBA/hnj5R50j8l0uWDunzo/1M3MShqqaozUo9Wx7J/XWS3VJ9XYIYp1CYF2g
	G7xmKnOty43GvRaNI4FV1DnnqjdN398=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-du_jNDkdOW6KXb4fSBVaYQ-1; Wed, 13 Sep 2023 07:41:17 -0400
X-MC-Unique: du_jNDkdOW6KXb4fSBVaYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D057B1032965;
	Wed, 13 Sep 2023 11:41:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 042992156721;
	Wed, 13 Sep 2023 11:41:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BC79319465B7;
	Wed, 13 Sep 2023 11:41:14 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F387419465B5 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 13 Sep 2023 11:40:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 198112156722; Wed, 13 Sep 2023 11:40:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 122502156721
 for <linux-cachefs@redhat.com>; Wed, 13 Sep 2023 11:40:55 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E49BF88904B
 for <linux-cachefs@redhat.com>; Wed, 13 Sep 2023 11:40:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-TfUBQ4iUMMqCymcZvoPEaw-1; Wed, 13 Sep 2023 07:40:51 -0400
X-MC-Unique: TfUBQ4iUMMqCymcZvoPEaw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05857618E8;
 Wed, 13 Sep 2023 11:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04725C433C7;
 Wed, 13 Sep 2023 11:40:48 +0000 (UTC)
Message-ID: <1e47cd45f01fc996873387a6021a98874c0ee030.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>
Date: Wed, 13 Sep 2023 07:40:47 -0400
In-Reply-To: <3d7271bdcb81239fac471bdb2c4e4ff63d3a65b3.camel@kernel.org>
References: <20230608214137.856006-1-dwysocha@redhat.com>
 <3d7271bdcb81239fac471bdb2c4e4ff63d3a65b3.camel@kernel.org>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH] netfs: Only call folio_start_fscache
 time for each folio
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2023-09-11 at 13:02 -0400, Jeff Layton wrote:
> On Thu, 2023-06-08 at 17:41 -0400, Dave Wysochanski wrote:
> > If a network filesystem using netfs implements a clamp_length()
> > function, it can set subrequest lengths smaller than a page size.
> > When we loop through the folios in netfs_rreq_unlock_folios() to
> > set any folios to be written back, we need to make sure we only
> > call folio_start_fscache() once for each folio.  Otherwise,
> > this simple testcase:
> >   mount -o fsc,rsize=1024,wsize=1024 127.0.0.1:/export /mnt/nfs
> >   dd if=/dev/zero of=/mnt/nfs/file.bin bs=4096 count=1
> >   1+0 records in
> >   1+0 records out
> >   4096 bytes (4.1 kB, 4.0 KiB) copied, 0.0126359 s, 324 kB/s
> >   cat /mnt/nfs/file.bin > /dev/null
> > 
> > will trigger an oops similar to the following:
> > ...
> >  page dumped because: VM_BUG_ON_FOLIO(folio_test_private_2(folio))
> >  ------------[ cut here ]------------
> >  kernel BUG at include/linux/netfs.h:44!
> > ...
> >  CPU: 5 PID: 134 Comm: kworker/u16:5 Kdump: loaded Not tainted 6.4.0-rc5
> > ...
> >  RIP: 0010:netfs_rreq_unlock_folios+0x68e/0x730 [netfs]
> > ...
> >  Call Trace:
> >   <TASK>
> >   netfs_rreq_assess+0x497/0x660 [netfs]
> >   netfs_subreq_terminated+0x32b/0x610 [netfs]
> >   nfs_netfs_read_completion+0x14e/0x1a0 [nfs]
> >   nfs_read_completion+0x2f9/0x330 [nfs]
> >   rpc_free_task+0x72/0xa0 [sunrpc]
> >   rpc_async_release+0x46/0x70 [sunrpc]
> >   process_one_work+0x3bd/0x710
> >   worker_thread+0x89/0x610
> >   kthread+0x181/0x1c0
> >   ret_from_fork+0x29/0x50
> > 
> > Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
> > ---
> >  fs/netfs/buffered_read.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
> > index 3404707ddbe7..0dafd970c1b6 100644
> > --- a/fs/netfs/buffered_read.c
> > +++ b/fs/netfs/buffered_read.c
> > @@ -21,6 +21,7 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
> >  	pgoff_t last_page = ((rreq->start + rreq->len) / PAGE_SIZE) - 1;
> >  	size_t account = 0;
> >  	bool subreq_failed = false;
> > +	bool folio_started;
> 
> nit: I'd move this declaration inside the xas_for_each loop, and just
> initialize it to false there.
> 
> >  
> >  	XA_STATE(xas, &rreq->mapping->i_pages, start_epage);
> >  
> > @@ -53,6 +54,7 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
> >  
> >  		pg_end = folio_pos(folio) + folio_size(folio) - 1;
> >  
> > +		folio_started = false;
> >  		for (;;) {
> >  			loff_t sreq_end;
> >  
> > @@ -60,8 +62,10 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
> >  				pg_failed = true;
> >  				break;
> >  			}
> > -			if (test_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags))
> > +			if (!folio_started && test_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags)) {
> >  				folio_start_fscache(folio);
> > +				folio_started = true;
> > +			}
> >  			pg_failed |= subreq_failed;
> >  			sreq_end = subreq->start + subreq->len - 1;
> >  			if (pg_end < sreq_end)
> 
> 
> The logic looks correct though.
> 
> Reviewed-by: Jeff Layton <jlayton@kernel.org>

David, can you review/merge this patch? This apparently fixes a panic
with NFS and fscache.

Thanks,
-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

