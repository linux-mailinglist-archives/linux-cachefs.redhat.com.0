Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9423AEBC8
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Jun 2021 16:52:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-KFuh_CX9M_-wLqRYpRHY2w-1; Mon, 21 Jun 2021 10:52:12 -0400
X-MC-Unique: KFuh_CX9M_-wLqRYpRHY2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A5D9835BED;
	Mon, 21 Jun 2021 14:52:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C47A5C1C2;
	Mon, 21 Jun 2021 14:52:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD3361809C99;
	Mon, 21 Jun 2021 14:52:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15LEpaK0027164 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 10:51:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 595844C819; Mon, 21 Jun 2021 14:51:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54E7D49C3B
	for <linux-cachefs@redhat.com>; Mon, 21 Jun 2021 14:51:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92F3D80234F
	for <linux-cachefs@redhat.com>; Mon, 21 Jun 2021 14:51:33 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-357-WYwPbe0UMya_v8OQ52bmsQ-1; Mon, 21 Jun 2021 10:51:29 -0400
X-MC-Unique: WYwPbe0UMya_v8OQ52bmsQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1lvLGD-00DCT3-5t; Mon, 21 Jun 2021 14:51:03 +0000
Date: Mon, 21 Jun 2021 15:50:49 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YNCnSQyKWqV8SkRs@casper.infradead.org>
References: <162391823192.1173366.9740514875196345746.stgit@warthog.procyon.org.uk>
	<162391826758.1173366.11794946719301590013.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <162391826758.1173366.11794946719301590013.stgit@warthog.procyon.org.uk>
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
Cc: Andrew W Elble <aweits@rit.edu>, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v2 3/3] netfs: fix test for whether we
 can skip read when writing beyond EOF
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 17, 2021 at 09:24:27AM +0100, David Howells wrote:
> From: Jeff Layton <jlayton@kernel.org>
> 
> It's not sufficient to skip reading when the pos is beyond the EOF.
> There may be data at the head of the page that we need to fill in
> before the write.
> 
> Add a new helper function that corrects and clarifies the logic of
> when we can skip reads, and have it only zero out the part of the page
> that won't have data copied in for the write.
> 
> Finally, don't set the page Uptodate after zeroing. It's not up to date
> since the write data won't have been copied in yet.
> 
> [DH made the following changes:
> 
>  - Prefixed the new function with "netfs_".
> 
>  - Don't call zero_user_segments() for a full-page write.
> 
>  - Altered the beyond-last-page check to avoid a DIV instruction and got
>    rid of then-redundant zero-length file check.
> ]
> 
> Fixes: e1b1240c1ff5f ("netfs: Add write_begin helper")
> Reported-by: Andrew W Elble <aweits@rit.edu>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: ceph-devel@vger.kernel.org
> Link: https://lore.kernel.org/r/20210613233345.113565-1-jlayton@kernel.org/
> Link: https://lore.kernel.org/r/162367683365.460125.4467036947364047314.stgit@warthog.procyon.org.uk/ # v1

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

