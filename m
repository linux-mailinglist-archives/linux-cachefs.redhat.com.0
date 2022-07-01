Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 802755631B7
	for <lists+linux-cachefs@lfdr.de>; Fri,  1 Jul 2022 12:44:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656672261;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+WobK0jN9ahi6jmcv+pDcMrD8jL2cl8JmifK2Mc5Ngo=;
	b=Jv+sELmU/y3ClRi+nUbEusInimXFNzx2jUD8UaKxAU5GwMGXjlTtMZBsy4/iuLv2mnSYDG
	zNYmAMLaHki7KwqLbDM8t5oxznkk/cBUnCk0r2pE4y668l1jhh81ytxU85CFw48fxaUCAe
	W6kJ1wlxVN6KWlSeUHVr6O+IZ72pqvc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-YHH6ZLBaNVqmtbMEDWO-5w-1; Fri, 01 Jul 2022 06:44:18 -0400
X-MC-Unique: YHH6ZLBaNVqmtbMEDWO-5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7988518E530C;
	Fri,  1 Jul 2022 10:44:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E55351400C30;
	Fri,  1 Jul 2022 10:44:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7F1491947073;
	Fri,  1 Jul 2022 10:44:15 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0E2FC1947058 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  1 Jul 2022 10:44:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CEF9140D2830; Fri,  1 Jul 2022 10:44:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA76240D282E
 for <linux-cachefs@redhat.com>; Fri,  1 Jul 2022 10:44:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B05132919ED6
 for <linux-cachefs@redhat.com>; Fri,  1 Jul 2022 10:44:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-8A4A91WzO0a3XR9hHmm18w-1; Fri, 01 Jul 2022 06:44:12 -0400
X-MC-Unique: 8A4A91WzO0a3XR9hHmm18w-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C773F6245B;
 Fri,  1 Jul 2022 10:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49CEBC3411E;
 Fri,  1 Jul 2022 10:38:59 +0000 (UTC)
Message-ID: <30a4bd0e19626f5fb30f19f0ae70fba2debb361a.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: xiubli@redhat.com, idryomov@gmail.com, dhowells@redhat.com
Date: Fri, 01 Jul 2022 06:38:57 -0400
In-Reply-To: <20220701022947.10716-2-xiubli@redhat.com>
References: <20220701022947.10716-1-xiubli@redhat.com>
 <20220701022947.10716-2-xiubli@redhat.com>
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH 1/2] netfs: release the folio lock and
 put the folio before retrying
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
Cc: keescook@chromium.org, linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, vshankar@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2022-07-01 at 10:29 +0800, xiubli@redhat.com wrote:
> From: Xiubo Li <xiubli@redhat.com>
> 
> The lower layer filesystem should always make sure the folio is
> locked and do the unlock and put the folio in netfs layer.
> 
> URL: https://tracker.ceph.com/issues/56423
> Signed-off-by: Xiubo Li <xiubli@redhat.com>
> ---
>  fs/netfs/buffered_read.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
> index 42f892c5712e..257fd37c2461 100644
> --- a/fs/netfs/buffered_read.c
> +++ b/fs/netfs/buffered_read.c
> @@ -351,8 +351,11 @@ int netfs_write_begin(struct netfs_inode *ctx,
>  		ret = ctx->ops->check_write_begin(file, pos, len, folio, _fsdata);
>  		if (ret < 0) {
>  			trace_netfs_failure(NULL, NULL, ret, netfs_fail_check_write_begin);
> -			if (ret == -EAGAIN)
> +			if (ret == -EAGAIN) {
> +				folio_unlock(folio);
> +				folio_put(folio);
>  				goto retry;
> +			}
>  			goto error;
>  		}
>  	}

I don't know here... I think it might be better to just expect that when
this function returns an error that the folio has already been unlocked.
Doing it this way will mean that you will lock and unlock the folio a
second time for no reason.

Maybe something like this instead?

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 42f892c5712e..8ae7b0f4c909 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -353,7 +353,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
                        trace_netfs_failure(NULL, NULL, ret, netfs_fail_check_write_begin);
                        if (ret == -EAGAIN)
                                goto retry;
-                       goto error;
+                       goto error_unlocked;
                }
        }
 
@@ -418,6 +418,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
 error:
        folio_unlock(folio);
        folio_put(folio);
+error_unlocked:
        _leave(" = %d", ret);
        return ret;
 }

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

