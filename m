Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B4B213B4872
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Jun 2021 19:49:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-DjZSgXcGNcCPLlRrbRyNXg-1; Fri, 25 Jun 2021 13:49:18 -0400
X-MC-Unique: DjZSgXcGNcCPLlRrbRyNXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C277F50752;
	Fri, 25 Jun 2021 17:49:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF97360C5F;
	Fri, 25 Jun 2021 17:49:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D3934EA2A;
	Fri, 25 Jun 2021 17:49:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15PHn6fs003458 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 25 Jun 2021 13:49:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC96910547DE; Fri, 25 Jun 2021 17:49:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7C0510547D0
	for <linux-cachefs@redhat.com>; Fri, 25 Jun 2021 17:49:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3872E10AC3A2
	for <linux-cachefs@redhat.com>; Fri, 25 Jun 2021 17:49:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-451-ezZ7Cpv5MAeJ2UgaEPO9fw-1;
	Fri, 25 Jun 2021 13:49:00 -0400
X-MC-Unique: ezZ7Cpv5MAeJ2UgaEPO9fw-1
Received: by mail.kernel.org (Postfix) with ESMTPS id 0E18961919;
	Fri, 25 Jun 2021 17:48:59 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
	[127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id
	079F160A38; Fri, 25 Jun 2021 17:48:59 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <2842348.1624308062@warthog.procyon.org.uk>
References: <2842348.1624308062@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <ceph-devel.vger.kernel.org>
X-PR-Tracked-Message-Id: <2842348.1624308062@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	tags/netfs-fixes-20210621
X-PR-Tracked-Commit-Id: 827a746f405d25f79560c7868474aec5aee174e1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9e736cf7d6f0dac63855ba74c94b85898485ba7a
Message-Id: <162464333902.2214.16258138937762470940.pr-tracker-bot@kernel.org>
Date: Fri, 25 Jun 2021 17:48:59 +0000
To: David Howells <dhowells@redhat.com>
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
Cc: Andrew W Elble <aweits@rit.edu>, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-cachefs@redhat.com, Al Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	torvalds@linux-foundation.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [GIT PULL] netfs, afs: Fix write_begin/end
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
MIME-Version: 1.0
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Mon, 21 Jun 2021 21:41:02 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/netfs-fixes-20210621

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9e736cf7d6f0dac63855ba74c94b85898485ba7a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

