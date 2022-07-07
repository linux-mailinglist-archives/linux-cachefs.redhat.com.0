Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A3156A08B
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Jul 2022 12:56:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657191401;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z5lVSRQWSOfvx61U9E6r+9lfCobqezATjdziqwHDs+s=;
	b=LliK187Gank2KyGFVzTK4vTsyRSsQRFNNFgxpHlrTtQrPh5KqzdTQaN1XheNbrXi3/ORFv
	EuyZOFB5nMKn2Pi0JIWfLuWO++ZZWFE7fCWizKV7k6riL8p4ICBrn0AsE80eucX/xFkdCj
	L6ubkxm/2TjcKBjovCmxGMIi1yoxKnw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-t54-rZJoPNOl-vLvnG1p7w-1; Thu, 07 Jul 2022 06:56:38 -0400
X-MC-Unique: t54-rZJoPNOl-vLvnG1p7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D8338001EA;
	Thu,  7 Jul 2022 10:56:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C8682EF9C;
	Thu,  7 Jul 2022 10:56:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 02C23194706B;
	Thu,  7 Jul 2022 10:56:37 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 728F01947067 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Jul 2022 10:56:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4EA4A404C31E; Thu,  7 Jul 2022 10:56:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ABC6404C6DD
 for <linux-cachefs@redhat.com>; Thu,  7 Jul 2022 10:56:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 331FF3826A40
 for <linux-cachefs@redhat.com>; Thu,  7 Jul 2022 10:56:35 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-MIB5DeCfMEynHP_G9K3Xvw-1; Thu, 07 Jul 2022 06:56:25 -0400
X-MC-Unique: MIB5DeCfMEynHP_G9K3Xvw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 22394B82047;
 Thu,  7 Jul 2022 10:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4410C3411E;
 Thu,  7 Jul 2022 10:56:09 +0000 (UTC)
Message-ID: <f60dacead3da4ab78edd225749d698f8e621f577.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: xiubli@redhat.com, dhowells@redhat.com, idryomov@gmail.com
Date: Thu, 07 Jul 2022 06:56:08 -0400
In-Reply-To: <20220707045112.10177-3-xiubli@redhat.com>
References: <20220707045112.10177-1-xiubli@redhat.com>
 <20220707045112.10177-3-xiubli@redhat.com>
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH v3 2/2] afs: unlock the folio when vnode
 is marked deleted
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
 william.kucharski@oracle.com, linux-cachefs@redhat.com, vshankar@redhat.com,
 marc.dionne@auristor.com, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, kirill.shutemov@linux.intel.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2022-07-07 at 12:51 +0800, xiubli@redhat.com wrote:
> From: Xiubo Li <xiubli@redhat.com>
> 
> The check_write_begin() should unlock the folio if return non-zero,
> otherwise locked.
> 
> URL: https://tracker.ceph.com/issues/56423
> Signed-off-by: Xiubo Li <xiubli@redhat.com>
> ---
>  fs/afs/file.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/afs/file.c b/fs/afs/file.c
> index afacce797fb9..b23e7b5a48ad 100644
> --- a/fs/afs/file.c
> +++ b/fs/afs/file.c
> @@ -379,7 +379,13 @@ static int afs_check_write_begin(struct file *file, loff_t pos, unsigned len,
>  {
>  	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
>  
> -	return test_bit(AFS_VNODE_DELETED, &vnode->flags) ? -ESTALE : 0;
> +	if (test_bit(AFS_VNODE_DELETED, &vnode->flags)) {
> +		folio_unlock(*folio);
> +		folio_put(*folio);

Don't you also need this?

	*folio = NULL;

> +		return -ESTALE;
> +	}
> +
> +	return 0;
>  }
>  
>  static void afs_free_request(struct netfs_io_request *rreq)

-- 
Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

