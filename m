Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F88F46BCCB
	for <lists+linux-cachefs@lfdr.de>; Tue,  7 Dec 2021 14:43:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-hgJpa_U1OJOAEShdywQgzw-1; Tue, 07 Dec 2021 08:43:24 -0500
X-MC-Unique: hgJpa_U1OJOAEShdywQgzw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA731100C662;
	Tue,  7 Dec 2021 13:43:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBF865ED45;
	Tue,  7 Dec 2021 13:43:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC6904BB7B;
	Tue,  7 Dec 2021 13:43:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B4MCQAJ001275 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 4 Dec 2021 17:12:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EDF371410DD7; Sat,  4 Dec 2021 22:12:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E94D61410DD5
	for <linux-cachefs@redhat.com>; Sat,  4 Dec 2021 22:12:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF297185A7B2
	for <linux-cachefs@redhat.com>; Sat,  4 Dec 2021 22:12:25 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-487-swiRoIrdN6S8dl5zhDO6cA-1; Sat, 04 Dec 2021 17:12:24 -0500
X-MC-Unique: swiRoIrdN6S8dl5zhDO6cA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1A288B80DA3;
	Sat,  4 Dec 2021 22:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED114C341C6;
	Sat,  4 Dec 2021 22:03:52 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
To: David Howells <dhowells@redhat.com>
Date: Sat,  4 Dec 2021 23:03:16 +0100
Message-Id: <20211204220350.633811-1-arnd@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1B4MCQAJ001275
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 07 Dec 2021 08:41:58 -0500
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>,
	llvm@lists.linux.dev, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH] cachefiles: fix
	__cachefiles_prepare_write() error handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Arnd Bergmann <arnd@arndb.de>

clang points out that __cachefiles_prepare_write() returns an
uninitialized error code in one of the code paths:

fs/cachefiles/io.c:489:6: error: variable 'ret' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
        if (pos == 0)
            ^~~~~~~~
fs/cachefiles/io.c:492:6: note: uninitialized use occurs here
        if (ret < 0) {
            ^~~
fs/cachefiles/io.c:489:2: note: remove the 'if' if its condition is always true
        if (pos == 0)
        ^~~~~~~~~~~~~
fs/cachefiles/io.c:440:9: note: initialize the variable 'ret' to silence this warning
        int ret;
               ^

Rework to return zero for success here and skip the rest of the
function.

Fixes: 0443b01eccbb ("cachefiles: Implement the I/O routines")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/cachefiles/io.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 74ef4d1fc562..0fab313a604d 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -486,9 +486,11 @@ static int __cachefiles_prepare_write(struct netfs_cache_resources *cres,
 	/* Partially allocated, but insufficient space: cull. */
 	fscache_count_no_write_space();
 	pos = cachefiles_inject_remove_error();
-	if (pos == 0)
-		ret = vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
-				    *_start, *_len);
+	if (pos != 0)
+		return 0;
+
+	ret = vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
+			    *_start, *_len);
 	if (ret < 0) {
 		trace_cachefiles_io_error(object, file_inode(file), ret,
 					  cachefiles_trace_fallocate_error);
-- 
2.29.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

