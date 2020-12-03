Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B46122CE1DB
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 23:36:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-RdG0OmNhPLmhOx0mBZOYNQ-1; Thu, 03 Dec 2020 17:36:10 -0500
X-MC-Unique: RdG0OmNhPLmhOx0mBZOYNQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D8F6809DC9;
	Thu,  3 Dec 2020 22:36:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA0EA5D9CA;
	Thu,  3 Dec 2020 22:36:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7EF4C1809CA0;
	Thu,  3 Dec 2020 22:36:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3MXTZw011269 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 17:33:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 319DA2166B2B; Thu,  3 Dec 2020 22:33:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CDA32166B27
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 22:33:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E192D1871CC4
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 22:33:26 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-455-tDIZvLwWPoKfIYsmDlBBVA-1; Thu, 03 Dec 2020 17:33:21 -0500
X-MC-Unique: tDIZvLwWPoKfIYsmDlBBVA-1
Received: from dread.disaster.area (pa49-179-6-140.pa.nsw.optusnet.com.au
	[49.179.6.140])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id EED963C2233;
	Fri,  4 Dec 2020 09:12:03 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1kkwpW-000Cb3-Ub; Fri, 04 Dec 2020 09:12:02 +1100
Date: Fri, 4 Dec 2020 09:12:02 +1100
From: Dave Chinner <david@fromorbit.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <20201203221202.GA4170059@dread.disaster.area>
References: <914680.1607004656@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <914680.1607004656@warthog.procyon.org.uk>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=Ubgvt5aN c=1 sm=1 tr=0 cx=a_idp_d
	a=uDU3YIYVKEaHT0eX+MXYOQ==:117 a=uDU3YIYVKEaHT0eX+MXYOQ==:17
	a=kj9zAlcOel0A:10 a=zTNgK-yGK50A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
	a=7-415B0cAAAA:8 a=rZepROtmVEJqsJtNp94A:9 a=CjuIK1q_8ugA:10
	a=AjGcO6oz07-iQ99wixmX:22 a=biEYGPWJfzWAr4FL6Ov7:22
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>, linux-cachefs@redhat.com,
	dchinner@redhat.com, linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] Problems doing DIO to netfs cache on XFS from
	Ceph
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 03, 2020 at 02:10:56PM +0000, David Howells wrote:
> Hi Christoph,
> 
> We're having a problem making the fscache/cachefiles rewrite work with XFS, if
> you could have a look?  Jeff Layton just tripped the attached warning from
> this:
> 
> 	/*
> 	 * Given that we do not allow direct reclaim to call us, we should
> 	 * never be called in a recursive filesystem reclaim context.
> 	 */
> 	if (WARN_ON_ONCE(current->flags & PF_MEMALLOC_NOFS))
> 		goto redirty;

I've pointed out in other threads where issues like this have been
raised that this check is not correct and was broken some time ago
by the PF_FSTRANS removal. The "NOFS" case here was originally using
PF_FSTRANS to protect against recursion from within transaction
contexts, not recursion through memory reclaim.  Doing writeback
from memory reclaim is caught by the preceeding PF_MEMALLOC check,
not this one.

What it is supposed to be warning about is that writeback in XFS can
start new transactions and nesting transactions is a guaranteed way
to deadlock the journal. IOWs, doing writeback from an active
transaction context is a bug in XFS.

IOWs, we are waiting on a new version of this patchset to be posted:

https://lore.kernel.org/linux-xfs/20201103131754.94949-1-laoar.shao@gmail.com/

so that we can get rid of this from iomap and check the transaction
recursion case directly in the XFS code. Then your problem goes away
completely....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

