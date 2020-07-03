Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 595EF215A39
	for <lists+linux-cachefs@lfdr.de>; Mon,  6 Jul 2020 17:02:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-NpunydE1MXWwSZZbYGZpBg-1; Mon, 06 Jul 2020 11:02:39 -0400
X-MC-Unique: NpunydE1MXWwSZZbYGZpBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C0D3BFC0;
	Mon,  6 Jul 2020 15:02:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2858910021B3;
	Mon,  6 Jul 2020 15:02:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1134172F52;
	Mon,  6 Jul 2020 15:02:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063MD4H6001594 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 18:13:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B6A3FDBB1F; Fri,  3 Jul 2020 22:13:04 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1DA7DEEF2
	for <linux-cachefs@redhat.com>; Fri,  3 Jul 2020 22:13:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA317100FD85
	for <linux-cachefs@redhat.com>; Fri,  3 Jul 2020 22:13:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-103-m7CzrBJxOUy5oH8QOZkWGQ-1; Fri, 03 Jul 2020 18:13:00 -0400
X-MC-Unique: m7CzrBJxOUy5oH8QOZkWGQ-1
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
	by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrTTt-0006uZ-7v; Fri, 03 Jul 2020 21:44:25 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  3 Jul 2020 14:43:25 -0700
Message-Id: <20200703214325.31036-11-rdunlap@infradead.org>
In-Reply-To: <20200703214325.31036-1-rdunlap@infradead.org>
References: <20200703214325.31036-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 06 Jul 2020 11:02:32 -0400
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
	Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
	autofs@vger.kernel.org, linux-unionfs@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Miklos Szeredi <miklos@szeredi.hu>,
	linux-fscrypt@vger.kernel.org, linux-cachefs@redhat.com,
	Joel Becker <jlbec@evilplan.org>, linux-fsdevel@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	Christoph Hellwig <hch@lst.de>, Ian Kent <raven@themaw.net>
Subject: [Linux-cachefs] [PATCH 10/10] Documentation: filesystems: vfs: drop
	doubled words
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Drop the doubled words "the".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
---
 Documentation/filesystems/vfs.rst |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20200701.orig/Documentation/filesystems/vfs.rst
+++ linux-next-20200701/Documentation/filesystems/vfs.rst
@@ -392,7 +392,7 @@ Extended attributes are name:value pairs
 ``set``
 	Called by the VFS to set the value of a particular extended
 	attribute.  When the new value is NULL, called to remove a
-	particular extended attribute.  This method is called by the the
+	particular extended attribute.  This method is called by the
 	setxattr(2) and removexattr(2) system calls.
 
 When none of the xattr handlers of a filesystem match the specified
@@ -652,7 +652,7 @@ at any point after PG_Dirty is clear.  O
 PG_Writeback is cleared.
 
 Writeback makes use of a writeback_control structure to direct the
-operations.  This gives the the writepage and writepages operations some
+operations.  This gives the writepage and writepages operations some
 information about the nature of and reason for the writeback request,
 and the constraints under which it is being done.  It is also used to
 return information back to the caller about the result of a writepage or

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

