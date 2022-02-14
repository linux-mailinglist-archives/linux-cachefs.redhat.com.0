Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7264B5651
	for <lists+linux-cachefs@lfdr.de>; Mon, 14 Feb 2022 17:35:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644856528;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LuPIPzBvFWbM2SeJpujDxBN4E4KJDF+2oxAZoem9Qgk=;
	b=hECI7kH/5Il7wmljvou2Xx1iy8HgcIQIA+Ua+c7S+5mwMGYBNpbQzKBe3JPx5qoF1NuNvy
	Y/mxf4i7HMH0QynSmCqzgUykMfn52bd/r58GNYMh6RLih3MsJ4u+Qe18RGMJW2A4z+wtmR
	mdO+puTRPYlZ6DMu7sFbm1yPlqwl7J8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-iI6x761OOzqa5caj-R045w-1; Mon, 14 Feb 2022 11:35:20 -0500
X-MC-Unique: iI6x761OOzqa5caj-R045w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC5C71091DA0;
	Mon, 14 Feb 2022 16:35:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C7687E224;
	Mon, 14 Feb 2022 16:35:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 410F74BB7C;
	Mon, 14 Feb 2022 16:35:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21EGXQn3027347 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 14 Feb 2022 11:33:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1B6857D70A; Mon, 14 Feb 2022 16:33:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98C027D70E;
	Mon, 14 Feb 2022 16:33:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CACdtm0YtxAUMet_PSxpg69OR9_TQbMQOzU5Kbm_5YDe_C7Nb-w@mail.gmail.com>
References: <CACdtm0YtxAUMet_PSxpg69OR9_TQbMQOzU5Kbm_5YDe_C7Nb-w@mail.gmail.com>
	<164311902471.2806745.10187041199819525677.stgit@warthog.procyon.org.uk>
	<164311919732.2806745.2743328800847071763.stgit@warthog.procyon.org.uk>
To: Rohith Surabattula <rohiths.msft@gmail.com>
MIME-Version: 1.0
Date: Mon, 14 Feb 2022 16:33:23 +0000
Message-ID: <3013921.1644856403@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 21EGXQn3027347
X-loop: linux-cachefs@redhat.com
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org, jlayton@kernel.org,
	smfrench@gmail.com, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] [RFC PATCH 7/7] cifs: Use netfslib to handle
	reads
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
Content-ID: <3013920.1644856403.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rohith Surabattula <rohiths.msft@gmail.com> wrote:

> I have tested netfs integration with fsc mount option enabled. But, I
> observed function "netfs_cache_prepare_read" always returns
> "NETFS_DOWNLOAD_FROM_SERVER" because cres->ops(i.e cachefiles
> operations) is not set.

I see it download from the server and write to the cache:

	# cat /proc/fs/fscache/stats 
	...
	IO     : rd=0 wr=4     <---- no reads, four writes made
	RdHelp : DR=0 RA=4 RP=0 WB=0 WBZ=0 rr=0 sr=0
	RdHelp : ZR=0 sh=0 sk=0
	RdHelp : DL=4 ds=4 df=0 di=0
	RdHelp : RD=0 rs=0 rf=0
	RdHelp : WR=4 ws=4 wf=0

Turning on the cachefiles_vol_coherency tracepoint, I see:

     kworker/2:2-1040    [002] .....   585.499799: cachefiles_vol_coherency: V=00000003 VOL BAD cmp  B=480004
     kworker/2:2-1040    [002] .....   585.499872: cachefiles_vol_coherency: V=00000003 VOL SET ok   B=480005

every time I unmount and mount again.  One of the fields is different each
time.

Using the netfs tracepoints, I can see the download being made from the server
and then the subsequent write to the cache:

          md5sum-4689    [003] .....   887.382290: netfs_read: R=00000005 READAHEAD c=0000004e ni=86 s=0 20000
          md5sum-4689    [003] .....   887.383076: netfs_read: R=00000005 EXPANDED  c=0000004e ni=86 s=0 400000
          md5sum-4689    [003] .....   887.383252: netfs_sreq: R=00000005[0] PREP  DOWN f=01 s=0 0/400000 e=0
          md5sum-4689    [003] .....   887.383252: netfs_sreq: R=00000005[0] SUBMT DOWN f=01 s=0 0/400000 e=0
           cifsd-4687    [002] .....   887.394926: netfs_sreq: R=00000005[0] TERM  DOWN f=03 s=0 400000/400000 e=0
           cifsd-4687    [002] .....   887.394928: netfs_rreq: R=00000005 ASSESS f=22
           cifsd-4687    [002] .....   887.394928: netfs_rreq: R=00000005 UNLOCK f=22
    kworker/u8:4-776     [000] .....   887.395000: netfs_rreq: R=00000005 WRITE  f=02
    kworker/u8:4-776     [000] .....   887.395005: netfs_sreq: R=00000005[0] WRITE DOWN f=03 s=0 400000/400000 e=0
     kworker/3:2-1001    [003] .....   887.627881: netfs_sreq: R=00000005[0] WTERM DOWN f=03 s=0 400000/400000 e=0
     kworker/3:2-1001    [003] .....   887.628163: netfs_rreq: R=00000005 DONE   f=02
     kworker/3:2-1001    [003] .....   887.628165: netfs_sreq: R=00000005[0] FREE  DOWN f=03 s=0 400000/400000 e=0
    kworker/u8:4-776     [000] .....   887.628216: netfs_rreq: R=00000005 FREE   f=02

Can you mount a cifs share with "-o fsc", read a file and then look in
/proc/fs/fscache/cookies and /proc/fs/fscache/stats for me?

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

