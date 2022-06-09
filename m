Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 326565458A4
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Jun 2022 01:28:51 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-2ZoFcJB-MiaHnkDtTkfBOg-1; Thu, 09 Jun 2022 19:28:47 -0400
X-MC-Unique: 2ZoFcJB-MiaHnkDtTkfBOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6A1229AA2F6;
	Thu,  9 Jun 2022 23:28:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 110132026D64;
	Thu,  9 Jun 2022 23:28:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D61381947069;
	Thu,  9 Jun 2022 23:28:45 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7043B1947040 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  9 Jun 2022 23:28:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6327240CF8E2; Thu,  9 Jun 2022 23:28:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EF2840466AD
 for <linux-cachefs@redhat.com>; Thu,  9 Jun 2022 23:28:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45FCA85A581
 for <linux-cachefs@redhat.com>; Thu,  9 Jun 2022 23:28:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-q8J6g9UQOr2Lw0vrGlK32w-1; Thu, 09 Jun 2022 19:28:43 -0400
X-MC-Unique: q8J6g9UQOr2Lw0vrGlK32w-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1BA1C62008;
 Thu,  9 Jun 2022 23:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580E0C34114;
 Thu,  9 Jun 2022 23:18:43 +0000 (UTC)
Date: Thu, 9 Jun 2022 16:18:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Frederick Lawler <fred@cloudflare.com>
Message-ID: <YqJ/0W3wxPThWqgC@sol.localdomain>
References: <20220608150942.776446-1-fred@cloudflare.com>
MIME-Version: 1.0
In-Reply-To: <20220608150942.776446-1-fred@cloudflare.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH v3] cred: Propagate
 security_prepare_creds() error code
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, amir73il@gmail.com,
 Paul Moore <paul@paul-moore.com>, linux-cifs@vger.kernel.org,
 selinux@vger.kernel.org, netdev@vger.kernel.org,
 Jeff Moyer <jmoyer@redhat.com>, linux-doc@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-cachefs@redhat.com,
 keyrings@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 kernel-team@cloudflare.com, serge@hallyn.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 08, 2022 at 10:09:42AM -0500, Frederick Lawler wrote:
> diff --git a/fs/aio.c b/fs/aio.c
> index 3c249b938632..5abbe88c3ca7 100644
> --- a/fs/aio.c
> +++ b/fs/aio.c
> @@ -1620,6 +1620,8 @@ static void aio_fsync_work(struct work_struct *work)
>  static int aio_fsync(struct fsync_iocb *req, const struct iocb *iocb,
>  		     bool datasync)
>  {
> +	int err;
> +
>  	if (unlikely(iocb->aio_buf || iocb->aio_offset || iocb->aio_nbytes ||
>  			iocb->aio_rw_flags))
>  		return -EINVAL;
> @@ -1628,8 +1630,11 @@ static int aio_fsync(struct fsync_iocb *req, const struct iocb *iocb,
>  		return -EINVAL;
>  
>  	req->creds = prepare_creds();
> -	if (!req->creds)
> -		return -ENOMEM;
> +	if (IS_ERR(req->creds)) {
> +		err = PTR_ERR(req->creds);
> +		req->creds = NULL;
> +		return err;
> +	}

This part is a little ugly.  How about doing:

	creds = prepare_creds();
	if (IS_ERR(creds))
		return PTR_ERR(creds);
	req->creds = creds;

> diff --git a/fs/exec.c b/fs/exec.c
> index 0989fb8472a1..02624783e40e 100644
> --- a/fs/exec.c
> +++ b/fs/exec.c
> @@ -1468,15 +1468,19 @@ EXPORT_SYMBOL(finalize_exec);
>   */
>  static int prepare_bprm_creds(struct linux_binprm *bprm)
>  {
> +	int err = -ERESTARTNOINTR;
>  	if (mutex_lock_interruptible(&current->signal->cred_guard_mutex))
> -		return -ERESTARTNOINTR;
> +		return err;
>  
>  	bprm->cred = prepare_exec_creds();
> -	if (likely(bprm->cred))
> -		return 0;
> +	if (IS_ERR(bprm->cred)) {
> +		err = PTR_ERR(bprm->cred);
> +		bprm->cred = NULL;
> +		mutex_unlock(&current->signal->cred_guard_mutex);
> +		return err;
> +	}
>  
> -	mutex_unlock(&current->signal->cred_guard_mutex);
> -	return -ENOMEM;
> +	return 0;
>  }

Similarly:

static int prepare_bprm_creds(struct linux_binprm *bprm)
{
	struct cred *cred;

	if (mutex_lock_interruptible(&current->signal->cred_guard_mutex))
		return -ERESTARTNOINTR;

	cred = prepare_exec_creds();
	if (IS_ERR(cred)) {
		mutex_unlock(&current->signal->cred_guard_mutex);
		return PTR_ERR(cred);
	}
	bprm->cred = cred;
	return 0;
}

> diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
> index eec72ca962e2..6cf75aa83b6c 100644
> --- a/kernel/nsproxy.c
> +++ b/kernel/nsproxy.c
> @@ -311,6 +311,7 @@ static void put_nsset(struct nsset *nsset)
>  
>  static int prepare_nsset(unsigned flags, struct nsset *nsset)
>  {
> +	int err = -ENOMEM;
>  	struct task_struct *me = current;
>  
>  	nsset->nsproxy = create_new_namespaces(0, me, current_user_ns(), me->fs);
> @@ -324,6 +325,12 @@ static int prepare_nsset(unsigned flags, struct nsset *nsset)
>  	if (!nsset->cred)
>  		goto out;
>  
> +	if (IS_ERR(nsset->cred)) {
> +		err = PTR_ERR(nsset->cred);
> +		nsset->cred = NULL;
> +		goto out;
> +	}

Why is the NULL check above being kept?

Also, drivers/crypto/ccp/sev-dev.c needs to be updated.

- Eric

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

