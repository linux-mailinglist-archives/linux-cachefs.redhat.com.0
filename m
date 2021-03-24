Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E07E434737E
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Mar 2021 09:21:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616574095;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dJiiyOO6F4gwyBxh51z1suvoqwofGGY26RDU7Do9JJE=;
	b=hhdjKZogL8riUKDa2NhPmjpZTQGS8beHB02wrBlFCyrIah5MzmslhjXWVRBIc9hGokDWbO
	qiXHqjp/2d8AsF50arnEWd/dTBYxMQOJGxuYMEPw+EMOGQQwSTHxFfQgvTkRToCQ5Bac67
	+eq5A04ZsT0flRxRJUpOFWe91e+OcTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-iOO78_joMuifoIRXZol96Q-1; Wed, 24 Mar 2021 04:21:33 -0400
X-MC-Unique: iOO78_joMuifoIRXZol96Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 803AA180FCA0;
	Wed, 24 Mar 2021 08:21:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 290471972B;
	Wed, 24 Mar 2021 08:21:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0519B4BB7C;
	Wed, 24 Mar 2021 08:21:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12O8LQod014038 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 24 Mar 2021 04:21:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 31CDD59473; Wed, 24 Mar 2021 08:21:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-58.rdu2.redhat.com
	[10.10.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E7C6A6E6FD;
	Wed, 24 Mar 2021 08:21:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
To: torvalds@linux-foundation.org
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
Date: Wed, 24 Mar 2021 08:21:21 +0000
Message-ID: <2813194.1616574081@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12O8LQod014038
X-loop: linux-cachefs@redhat.com
Cc: linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [GIT PULL] cachefiles, afs: mm wait fixes
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2813136.1616574054.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Could you pull these patches from Matthew Wilcox to fix page
waiting-related issues in cachefiles and afs as extracted from his folio
series[1]:

 (1) In cachefiles, remove the use of the wait_bit_key struct to access
     something that's actually in wait_page_key format.  The proper struct
     is now available in the header, so that should be used instead.

 (2) Add a proper wait function for waiting killably on the page writeback
     flag.  This includes a recent bugfix[2] that's not in the afs code.

 (3) In afs, use the function added in (2) rather than using
     wait_on_page_bit_killable() which doesn't provide the aforementioned
     bugfix.

Notes:

 - I've included these together since they are an excerpt from a patch
   series of Willy's, but I can send the first separately from the other
   two if you'd prefer since they touch different modules.

 - The cachefiles patch could be deferred to the next merge window as
   whichever compiler is used probably *should* generate the same code for
   both structs, even with struct randomisation turned on.

 - AuriStor (auristor.com) have added certain of my branches to their
   automated AFS testing, hence the Tested-by kafs-testing@auristor.com tag
   on the patches in this set.  Is this the best way to represent this?

David

Link: https://lore.kernel.org/r/20210320054104.1300774-1-willy@infradead.org[1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c2407cf7d22d0c0d94cf20342b3b8f06f1d904e7 [2]
Link: https://lore.kernel.org/r/20210323120829.GC1719932@casper.infradead.org/ # v1

---
The following changes since commit 0d02ec6b3136c73c09e7859f0d0e4e2c4c07b49b:

  Linux 5.12-rc4 (2021-03-21 14:56:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/afs-cachefiles-fixes-20210323

for you to fetch changes up to 75b69799610c2b909a18e709c402923ea61aedc0:

  afs: Use wait_on_page_writeback_killable (2021-03-23 20:54:37 +0000)

----------------------------------------------------------------
cachefiles, afs: mm wait fixes

----------------------------------------------------------------
Matthew Wilcox (Oracle) (3):
      fs/cachefiles: Remove wait_bit_key layout dependency
      mm/writeback: Add wait_on_page_writeback_killable
      afs: Use wait_on_page_writeback_killable

 fs/afs/write.c          |  3 +--
 fs/cachefiles/rdwr.c    |  7 +++----
 include/linux/pagemap.h |  2 +-
 mm/page-writeback.c     | 16 ++++++++++++++++
 4 files changed, 21 insertions(+), 7 deletions(-)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

