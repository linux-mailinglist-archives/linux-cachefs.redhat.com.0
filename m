Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1E633270728
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Sep 2020 22:37:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-KhHHoDTdP9-FCbMqH7eMOg-1; Fri, 18 Sep 2020 16:37:03 -0400
X-MC-Unique: KhHHoDTdP9-FCbMqH7eMOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5028356FDE;
	Fri, 18 Sep 2020 20:37:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40CCC60C07;
	Fri, 18 Sep 2020 20:37:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CFD58C7C9;
	Fri, 18 Sep 2020 20:37:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07RGQ4Rx031621 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 12:26:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 33C072166BB3; Thu, 27 Aug 2020 16:26:04 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DFEB2166BA0
	for <linux-cachefs@redhat.com>; Thu, 27 Aug 2020 16:26:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2ADC7801223
	for <linux-cachefs@redhat.com>; Thu, 27 Aug 2020 16:26:01 +0000 (UTC)
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-470-bZ6uwgEKP3i__12PMzivzw-1; Thu, 27 Aug 2020 12:25:56 -0400
X-MC-Unique: bZ6uwgEKP3i__12PMzivzw-1
Received: by nautica.notk.org (Postfix, from userid 1001)
	id 30B06C009; Thu, 27 Aug 2020 18:18:39 +0200 (CEST)
Date: Thu, 27 Aug 2020 18:18:24 +0200
From: Dominique Martinet <asmadeus@codewreck.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20200827161824.GC31016@nautica>
References: <20200810164044.GA31753@lst.de>
	<1851200.1596472222@warthog.procyon.org.uk>
	<447452.1596109876@warthog.procyon.org.uk>
	<667820.1597072619@warthog.procyon.org.uk>
	<1428311.1598542135@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <1428311.1598542135@warthog.procyon.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 18 Sep 2020 16:35:29 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [GIT PULL] fscache rewrite -- please drop for
	now
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

David Howells wrote on Thu, Aug 27, 2020:
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > FYI, a giant rewrite dropping support for existing consumer is always
> > rather awkward.  Is there any way you could pre-stage some infrastructure
> > changes, and then do a temporary fscache2, which could then be renamed
> > back to fscache once everyone switched over?
> 
> That's a bit tricky.  There are three points that would have to be shared: the
> userspace miscdev interface, the backing filesystem and the single index tree.
> 
> It's probably easier to just have a go at converting 9P and cifs.  Making the
> old and new APIs share would be a fairly hefty undertaking in its own right.

While I agree something incremental is probably better, I have some free
time over the next few weeks so will take a shot at 9p; it's definitely
going to be easier.


Should I submit patches to you or wait until Linus merges it next cycle
and send them directly?

I see Jeff's ceph patches are still in his tree's ceph-fscache-iter
branch and I don't see them anywhere in your tree.

-- 
Dominique

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

