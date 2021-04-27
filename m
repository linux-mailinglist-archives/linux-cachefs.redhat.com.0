Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7781836CC6E
	for <lists+linux-cachefs@lfdr.de>; Tue, 27 Apr 2021 22:37:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-IFkyckosOmu76xRpAaQ_9Q-1; Tue, 27 Apr 2021 16:37:33 -0400
X-MC-Unique: IFkyckosOmu76xRpAaQ_9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BC1F107ACC7;
	Tue, 27 Apr 2021 20:37:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DFF96064B;
	Tue, 27 Apr 2021 20:37:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1757818095C9;
	Tue, 27 Apr 2021 20:37:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13RKbRdM031273 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 27 Apr 2021 16:37:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D729820BEDCE; Tue, 27 Apr 2021 20:37:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D314920BEABB
	for <linux-cachefs@redhat.com>; Tue, 27 Apr 2021 20:37:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB837805F47
	for <linux-cachefs@redhat.com>; Tue, 27 Apr 2021 20:37:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-138-MCV9y8m_PzaUcMOFcSXj7g-1;
	Tue, 27 Apr 2021 16:37:20 -0400
X-MC-Unique: MCV9y8m_PzaUcMOFcSXj7g-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E6C1613BC;
	Tue, 27 Apr 2021 20:37:17 +0000 (UTC)
Message-ID: <5035dded7d076718e2e3e6703c688f992e5f93de.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: pr-tracker-bot@kernel.org, David Howells <dhowells@redhat.com>
Date: Tue, 27 Apr 2021 16:37:16 -0400
In-Reply-To: <161955556055.29692.16460754787055823751.pr-tracker-bot@kernel.org>
References: <3779937.1619478404@warthog.procyon.org.uk>
	<161955556055.29692.16460754787055823751.pr-tracker-bot@kernel.org>
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34)
MIME-Version: 1.0
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
Cc: Dominique Martinet <asmadeus@codewreck.org>, linux-mm@kvack.org,
	Marc Dionne <marc.dionne@auristor.com>,
	linux-afs@lists.infradead.org, Marshall <hubcap@omnibond.com>,
	linux-cifs@vger.kernel.org, Trond,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Christoph Hellwig <hch@lst.de>, linux-cachefs@redhat.com,
	v9fs-developer@lists.sourceforge.net, Mike,
	Alexander Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org,
	Myklebust <trond.myklebust@hammerspace.com>,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [GIT PULL] Network fs helper library & fscache
	kiocb API
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

On Tue, 2021-04-27 at 20:32 +0000, pr-tracker-bot@kernel.org wrote:
> The pull request you sent on Tue, 27 Apr 2021 00:06:44 +0100:
> 
> > git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/netfs-lib-20210426
> 
> has been merged into torvalds/linux.git:
> https://git.kernel.org/torvalds/c/820c4bae40cb56466cfed6409e00d0f5165a990c
> 
> Thank you!
> 

Hi Ilya,

With this, we should be clear to send a PR to Linus for what's in
master. The patches that Viro was carrying are also in mainline now too.

Cheers,
-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

