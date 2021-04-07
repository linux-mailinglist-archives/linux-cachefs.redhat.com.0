Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3046635762B
	for <lists+linux-cachefs@lfdr.de>; Wed,  7 Apr 2021 22:36:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-1xiBuH70O9e1RS1wJGZEmA-1; Wed, 07 Apr 2021 16:36:33 -0400
X-MC-Unique: 1xiBuH70O9e1RS1wJGZEmA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D261983DD20;
	Wed,  7 Apr 2021 20:36:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 782516A033;
	Wed,  7 Apr 2021 20:36:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7EE381809C82;
	Wed,  7 Apr 2021 20:36:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 137KaNKK011957 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 7 Apr 2021 16:36:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2A9562166BA3; Wed,  7 Apr 2021 20:36:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 253742166B2D
	for <linux-cachefs@redhat.com>; Wed,  7 Apr 2021 20:36:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C2B28007DD
	for <linux-cachefs@redhat.com>; Wed,  7 Apr 2021 20:36:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-52-aqQyeEV6PoqaapOGBMgZ2A-1; 
	Wed, 07 Apr 2021 16:36:18 -0400
X-MC-Unique: aqQyeEV6PoqaapOGBMgZ2A-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00ABE6108B;
	Wed,  7 Apr 2021 20:36:15 +0000 (UTC)
Message-ID: <0df4fd45c51dd8e87aa2a0869d81c39c9af83b31.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: David Howells <dhowells@redhat.com>
Date: Wed, 07 Apr 2021 16:36:14 -0400
In-Reply-To: <161781041339.463527.18139104281901492882.stgit@warthog.procyon.org.uk>
References: <161781041339.463527.18139104281901492882.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH 0/5] netfs: Fixes for the netfs lib
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

On Wed, 2021-04-07 at 16:46 +0100, David Howells wrote:
> Hi Jeff,
> 
> Here's a bunch of fixes plus a tracepoint for the netfs library.  I'm going
> to roll them into other patches, but I'm posting them here for separate
> review.
> 
> David
> ---
> David Howells (5):
>       netfs: Fix a missing rreq put in netfs_write_begin()
>       netfs: Call trace_netfs_read() after ->begin_cache_operation()
>       netfs: Don't record the copy termination error
>       netfs: Fix copy-to-cache amalgamation
>       netfs: Add a tracepoint to log failures that would be otherwise unseen
> 
> 
>  fs/cachefiles/io.c           | 17 ++++++++++
>  fs/netfs/read_helper.c       | 58 +++++++++++++++++++---------------
>  include/linux/netfs.h        |  6 ++++
>  include/trace/events/netfs.h | 60 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 116 insertions(+), 25 deletions(-)
> 
> 

Thanks David,

I rebased onto your branch and gave ceph a spin with fscache and it all
worked fine. Let me know when you get those rolled into your branch and
I'll rebase the ceph/testing branch on top of it.

Cheers,
-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

