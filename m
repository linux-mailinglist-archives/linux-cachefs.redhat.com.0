Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE08345D5E
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Mar 2021 12:53:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616500428;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nlFPH+NZ1RhlU8eENk49PGUCv34gaBHlpRRD8uOh2UI=;
	b=A1TZyMTLAiFmssZ2NJRGMQ2S2jtRf2caWDx71kUP8C0CSOmgBSRyCHC8VIJQdOxuOKCprl
	dGE5+zWEkMrbPNa/k+J548TapqzjpQbuA+WRoSq20Dn2fzEJnJZVZ8CgD2uLQBaAWwdr1Z
	GjCHgYxAngMgJRuq64P1G4tIsdoWXyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-ssag8hEwNRmIX7xbc40G6w-1; Tue, 23 Mar 2021 07:53:45 -0400
X-MC-Unique: ssag8hEwNRmIX7xbc40G6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E6BB8162A;
	Tue, 23 Mar 2021 11:53:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA0AB60877;
	Tue, 23 Mar 2021 11:53:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6CC254BB7C;
	Tue, 23 Mar 2021 11:53:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NBrV0n025373 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 07:53:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0382B60657; Tue, 23 Mar 2021 11:53:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-58.rdu2.redhat.com
	[10.10.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D3D582C168;
	Tue, 23 Mar 2021 11:53:23 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com, linux-afs@lists.infradead.org
Date: Tue, 23 Mar 2021 11:53:22 +0000
Message-ID: <161650040278.2445805.7652115256944270457.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH 0/3] cachefiles, afs: mm wait fixes
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


Here are some patches to fix page waiting-related issues in cachefiles and
afs[1]:

 (1) In cachefiles, remove the use of the wait_bit_key struct to access
     something that's actually in wait_page_key format.  The proper struct
     is now available in the header, so that should be used instead.

 (2) Add a proper wait function for waiting killably on the page writeback
     flag.  This includes a recent bugfix here (presumably commit
     c2407cf7d22d0c0d94cf20342b3b8f06f1d904e7).

 (3) In afs, use the function added in (2) rather than using
     wait_on_page_bit_killable() which doesn't have the aforementioned
     bugfix.

     Note that I modified this to work with the upstream code where the
     page pointer isn't cached in a local variable.

The patches can be found here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=afs-fixes

David

Link: https://lore.kernel.org/r/20210320054104.1300774-1-willy@infradead.org[1]

---
Matthew Wilcox (Oracle) (3):
      fs/cachefiles: Remove wait_bit_key layout dependency
      mm/writeback: Add wait_on_page_writeback_killable
      afs: Use wait_on_page_writeback_killable


 fs/afs/write.c          |  3 +--
 include/linux/pagemap.h |  1 +
 mm/page-writeback.c     | 16 ++++++++++++++++
 3 files changed, 18 insertions(+), 2 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

