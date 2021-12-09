Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC79646F440
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Dec 2021 20:49:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-u2BlNWduMEipn8Ew1ToEXQ-1; Thu, 09 Dec 2021 14:49:41 -0500
X-MC-Unique: u2BlNWduMEipn8Ew1ToEXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A7C3100F94D;
	Thu,  9 Dec 2021 19:49:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50D7B1F43D;
	Thu,  9 Dec 2021 19:49:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33E864A7CA;
	Thu,  9 Dec 2021 19:42:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B9JggrP000845 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 9 Dec 2021 14:42:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6E132400E12D; Thu,  9 Dec 2021 19:42:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69D6F400F3F1
	for <linux-cachefs@redhat.com>; Thu,  9 Dec 2021 19:42:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3249A3804069
	for <linux-cachefs@redhat.com>; Thu,  9 Dec 2021 19:42:42 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-514-SKWWAdH_OEKgz03Gif0leg-1; Thu, 09 Dec 2021 14:42:40 -0500
X-MC-Unique: SKWWAdH_OEKgz03Gif0leg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5BD48CE27B0;
	Thu,  9 Dec 2021 19:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A868C004DD;
	Thu,  9 Dec 2021 19:35:45 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
	[127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id
	7662260A37; Thu,  9 Dec 2021 19:35:45 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <2420479.1638912905@warthog.procyon.org.uk>
References: <2420479.1638912905@warthog.procyon.org.uk>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <2420479.1638912905@warthog.procyon.org.uk>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
	tags/netfs-fixes-20211207
X-PR-Tracked-Commit-Id: 3cfef1b612e15a0c2f5b1c9d3f3f31ad72d56fcd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2990c89d1df457bd623371324998ee849806ddd3
Message-Id: <163907854547.11961.11637701892287062553.pr-tracker-bot@kernel.org>
Date: Thu, 09 Dec 2021 19:35:45 +0000
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-cachefs@redhat.com
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	jlayton@kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	torvalds@linux-foundation.org
Subject: Re: [Linux-cachefs] [GIT PULL] netfs: Potential deadlock and error
	handling fixes
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Tue, 07 Dec 2021 21:35:05 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/netfs-fixes-20211207

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2990c89d1df457bd623371324998ee849806ddd3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

