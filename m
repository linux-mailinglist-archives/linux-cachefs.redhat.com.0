Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 412A869DDEF
	for <lists+linux-cachefs@lfdr.de>; Tue, 21 Feb 2023 11:33:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676975607;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=222KXwmVX+2F1hVVhU+aKot16Wcfumlx5246w2/DnzA=;
	b=fF4X+4MwtIOubopXuMNIBYqL5Ew3rZZounOTamN6G1gf+T/Gae3GWTCWxB9FqYzFvfr61Q
	NcMIObq9hZNRfphGqDoqo3LSlREfN2vN2EsY4gM7Ro4TTUF6okyafNrvrtx2OqlFHd+6tj
	9+/CNBYLnnMDhZ8VcP323p7B7PffCnU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-xXBDcz-VMq6bRncU8JheyQ-1; Tue, 21 Feb 2023 05:33:23 -0500
X-MC-Unique: xXBDcz-VMq6bRncU8JheyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48B143C0E454;
	Tue, 21 Feb 2023 10:33:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C9C704015308;
	Tue, 21 Feb 2023 10:33:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6AB23194658C;
	Tue, 21 Feb 2023 10:33:21 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D186E1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 21 Feb 2023 10:33:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A2958140EBF6; Tue, 21 Feb 2023 10:33:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AA89140EBF4
 for <linux-cachefs@redhat.com>; Tue, 21 Feb 2023 10:33:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7C63183B3C0
 for <linux-cachefs@redhat.com>; Tue, 21 Feb 2023 10:33:19 +0000 (UTC)
Received: from out30-99.freemail.mail.aliyun.com
 (out30-99.freemail.mail.aliyun.com [115.124.30.99]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-195-9vP6t-RKOUOnoIcCd0GSIw-1; Tue, 21 Feb 2023 05:33:17 -0500
X-MC-Unique: 9vP6t-RKOUOnoIcCd0GSIw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0VcC.gMp_1676975593
Received: from localhost(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VcC.gMp_1676975593) by smtp.aliyun-inc.com;
 Tue, 21 Feb 2023 18:33:14 +0800
From: Jingbo Xu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Tue, 21 Feb 2023 18:33:11 +0800
Message-Id: <20230221103313.120834-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH 0/2] fscache/cachefiles: some work for
 on-demand mode
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi there's some work to make users of fscache on-demand mode support
PAGE_SIZE larger than 4KB (e.g. 16/64KB in aarch64) [1].  I think they
may be also useful for other users of fscache/cachefiles.


Strictly speacking, patch 1 is a bug fix though the issue doesn't cause
serious harm when erofs doesn't support large PAGE_SIZE (other than
4KB).

__cachefiles_prepare_write() will align the requested file range to
PAGE_SIZE boundary.  This is reasonable for libnetfs as libnetfs will
construct an iter with the aligned file range from the ground.

While for fscache on-demand mode, cachefiles_ondemand_fd_write_iter() is
called by the user daemon, and thus it is unexpected to align the file
range to PAGE_SIZE boundary, as the iov_iter/kiocb is given by the user
daemon.  If the given file range is not aligned with the block size of
the backing filesystem, let's fail the write directly.


Patch 2 adds a new helper, by which users of fscache on-demand mode
could wait for the wrangling of the cache object and then derive the
object size (set in cachefiles_ondemand_copen()).
fscache_begin_read_operation() is not feasible for this purpose as
in this case @want_state is FSCACHE_WANT_PARAMS and it will not wait
there for object wrangling when cookie is in
FSCACHE_COOKIE_STATE_CREATING state.  An example use case of this helper
is illustrated in [2].


Any comment is welcomed.


[1] https://lore.kernel.org/all/20230221091719.126127-1-jefflexu@linux.alibaba.com/
[2] https://lore.kernel.org/all/20230221091719.126127-2-jefflexu@linux.alibaba.com/

Jingbo Xu (2):
  cachefiles: don't align the write IO in ondemand mode
  fscache: introduce fscache_begin_wait_operation() helper

 fs/cachefiles/ondemand.c |  3 ++-
 fs/fscache/io.c          |  9 +++++++++
 include/linux/fscache.h  | 22 ++++++++++++++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)

-- 
2.19.1.6.gb485710b

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

