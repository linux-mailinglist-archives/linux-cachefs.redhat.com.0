Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8F74040BAE3
	for <lists+linux-cachefs@lfdr.de>; Wed, 15 Sep 2021 00:01:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-VAQu_Gi5Maa_l9Ysc2kXog-1; Tue, 14 Sep 2021 18:01:19 -0400
X-MC-Unique: VAQu_Gi5Maa_l9Ysc2kXog-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A08B5074C;
	Tue, 14 Sep 2021 22:01:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 261405D6AD;
	Tue, 14 Sep 2021 22:01:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E12351803B30;
	Tue, 14 Sep 2021 22:01:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18EM1ERX028719 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 14 Sep 2021 18:01:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D2D11207AC4E; Tue, 14 Sep 2021 22:01:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCA4C207AC5A
	for <linux-cachefs@redhat.com>; Tue, 14 Sep 2021 22:01:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30C09811E76
	for <linux-cachefs@redhat.com>; Tue, 14 Sep 2021 22:01:12 +0000 (UTC)
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-370-UthVmgOqPdGkRxwy4rqWZw-1; Tue, 14 Sep 2021 18:01:10 -0400
X-MC-Unique: UthVmgOqPdGkRxwy4rqWZw-1
Received: by nautica.notk.org (Postfix, from userid 108)
	id 20E77C01F; Tue, 14 Sep 2021 23:51:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on nautica.notk.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=UNPARSEABLE_RELAY
	autolearn=unavailable version=3.3.2
Received: from odin.codewreck.org (localhost [127.0.0.1])
	by nautica.notk.org (Postfix) with ESMTPS id CE81AC009;
	Tue, 14 Sep 2021 23:51:45 +0200 (CEST)
Received: from localhost (odin.codewreck.org [local])
	by odin.codewreck.org (OpenSMTPD) with ESMTPA id 7519297c;
	Tue, 14 Sep 2021 21:51:41 +0000 (UTC)
Date: Wed, 15 Sep 2021 06:51:26 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YUEZXktGOCUWfvnU@codewreck.org>
References: <6274f0922aecd9b40dd7ff1ef007442ed996aed7.camel@redhat.com>
	<163162767601.438332.9017034724960075707.stgit@warthog.procyon.org.uk>
	<163162772646.438332.16323773205855053535.stgit@warthog.procyon.org.uk>
	<439558.1631628579@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <439558.1631628579@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 4/8] 9p: (untested) Convert to using the
 netfs helper lib to do reads and caching
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi folks,

David Howells wrote on Tue, Sep 14, 2021 at 03:09:39PM +0100:
> > Does this change require any of the earlier patches in the series? If
> > not, then it may be good to go ahead and merge this conversion
> > separately, ahead of the rest of the series.
> 
> There's a conflict with patch 1 - you can see the same changes made to afs and
> ceph there, but apart from that, no.  However, I can't do patch 6 without it
> being applied first.  If Dominique or one of the other 9p people can get Linus
> to apply it now, that would be great, but I think that unlikely since the
> merge window has passed.

Agreed with the merge window passed it'll be for next one -- but I'd
like this to sit in -next for as long as possible, so I'd appreciate
either being able to carry the patch in my tree (difficult as then
you'll need to base yourself on mine) or you putting it in there somehow
after I've got the most basic tests verified again (do you have a branch
pulled for linux-next?)

I'll try to get tests done in the next few days and check my notes for
things that were missing in the earlier version you gave me in the
past.. Sorry for not doing it myself, you're of great help.
-- 
Dominique

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

