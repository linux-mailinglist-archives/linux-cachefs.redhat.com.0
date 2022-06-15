Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E7E54CB02
	for <lists+linux-cachefs@lfdr.de>; Wed, 15 Jun 2022 16:15:15 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-_rhpful3MYuvYC6gp_A4Kw-1; Wed, 15 Jun 2022 10:15:11 -0400
X-MC-Unique: _rhpful3MYuvYC6gp_A4Kw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE2A985A584;
	Wed, 15 Jun 2022 14:15:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ECDE31121315;
	Wed, 15 Jun 2022 14:15:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 47AED1947042;
	Wed, 15 Jun 2022 14:15:06 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2C5BC19466DF for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 15 Jun 2022 14:14:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E70D840C141F; Wed, 15 Jun 2022 14:14:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2E224010E4D
 for <linux-cachefs@redhat.com>; Wed, 15 Jun 2022 14:14:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA41083397B
 for <linux-cachefs@redhat.com>; Wed, 15 Jun 2022 14:14:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-MR0kcjRbNmCGb5Nma1Jnxw-1; Wed, 15 Jun 2022 10:14:50 -0400
X-MC-Unique: MR0kcjRbNmCGb5Nma1Jnxw-1
Received: by mail-wr1-f52.google.com with SMTP id h19so12340171wrc.12
 for <linux-cachefs@redhat.com>; Wed, 15 Jun 2022 07:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TmFspR35i19OaG7kIq4BfP3Z5+5KHooJY8o+wf2Eu7g=;
 b=nHYCP3bpJbjNdog5Iz5rByqCZym0PunJh9/oVsbduc6pbkNweZpDYXJOOoqaX42ovZ
 fl1PxsSMDH+DAuTBBK+oD05ZpXW0mbhcS8io5unF4D29a9F5h+n0V0f67tBLY94gkLg3
 ra89/i3VrqsVbo2Tp3d+Bkjgj8LkNycu/NH+gfDjjUOUYlIelePOVUyui/PPoRFuDYVc
 Sly07/d+Ld+SUcjPkcBHT8IgejAz/nloNnA97tvWp7mOj4coYK/Md8LdOYgmtpevP0jA
 w+aSppzxboSI/ZqMdZmtQ7tKsugMupbkp6DjE3yHkJL865yVOL8C2tf7kbmnwaLzoeIU
 O8OQ==
X-Gm-Message-State: AJIora+Kw5OKZKBYynheVXgFsGqEoJtLJwN4A39brfiOXzwO9uY/1QFA
 1z5gsiQONe0E84xziA78VuF1zPUrZK4SFSayFkmeMSO1aQ==
X-Google-Smtp-Source: AGRyM1shZLCqZkkSojukqCXaW+5XT6IN8fQuWUaigb52d2YijY5GHtpeOYg1i3lr6LTItEcWJJFmcKwvqWFcwysL51U=
X-Received: by 2002:a05:6000:1447:b0:21a:278a:181c with SMTP id
 v7-20020a056000144700b0021a278a181cmr27393wrx.161.1655302489487; Wed, 15 Jun
 2022 07:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220608150942.776446-1-fred@cloudflare.com>
 <87tu8oze94.fsf@email.froward.int.ebiederm.org>
 <e1b62234-9b8a-e7c2-2946-5ef9f6f23a08@cloudflare.com>
 <87y1xzyhub.fsf@email.froward.int.ebiederm.org>
 <859cb593-9e96-5846-2191-6613677b07c5@cloudflare.com>
 <87o7yvxl4x.fsf@email.froward.int.ebiederm.org>
 <9ed91f15-420c-3db6-8b3b-85438b02bf97@cloudflare.com>
 <20220615103031.qkzae4xr34wysj4b@wittgenstein>
In-Reply-To: <20220615103031.qkzae4xr34wysj4b@wittgenstein>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 15 Jun 2022 10:14:38 -0400
Message-ID: <CAHC9VhR8yPHZb2sCu4JGgXOSs7rudm=9opB+-LsG6_Lta9466A@mail.gmail.com>
To: Christian Brauner <brauner@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, linux-doc@vger.kernel.org,
 selinux@vger.kernel.org, linux-cifs@vger.kernel.org,
 Jeff Moyer <jmoyer@redhat.com>, amir73il@gmail.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-cachefs@redhat.com,
 keyrings@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 kernel-team@cloudflare.com, Frederick Lawler <fred@cloudflare.com>,
 serge@hallyn.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 15, 2022 at 6:30 AM Christian Brauner <brauner@kernel.org> wrote:
>
> On Tue, Jun 14, 2022 at 01:59:08PM -0500, Frederick Lawler wrote:
> > On 6/14/22 11:30 AM, Eric W. Biederman wrote:
> > > Frederick Lawler <fred@cloudflare.com> writes:
> > >
> > > > On 6/13/22 11:44 PM, Eric W. Biederman wrote:
> > > > > Frederick Lawler <fred@cloudflare.com> writes:
> > > > >
> > > > > > Hi Eric,
> > > > > >
> > > > > > On 6/13/22 12:04 PM, Eric W. Biederman wrote:
> > > > > > > Frederick Lawler <fred@cloudflare.com> writes:
> > > > > > >
> > > > > > > > While experimenting with the security_prepare_creds() LSM hook, we
> > > > > > > > noticed that our EPERM error code was not propagated up the callstack.
> > > > > > > > Instead ENOMEM is always returned.  As a result, some tools may send a
> > > > > > > > confusing error message to the user:
> > > > > > > >
> > > > > > > > $ unshare -rU
> > > > > > > > unshare: unshare failed: Cannot allocate memory
> > > > > > > >
> > > > > > > > A user would think that the system didn't have enough memory, when
> > > > > > > > instead the action was denied.
> > > > > > > >
> > > > > > > > This problem occurs because prepare_creds() and prepare_kernel_cred()
> > > > > > > > return NULL when security_prepare_creds() returns an error code. Later,
> > > > > > > > functions calling prepare_creds() and prepare_kernel_cred() return
> > > > > > > > ENOMEM because they assume that a NULL meant there was no memory
> > > > > > > > allocated.
> > > > > > > >
> > > > > > > > Fix this by propagating an error code from security_prepare_creds() up
> > > > > > > > the callstack.
> > > > > > > Why would it make sense for security_prepare_creds to return an error
> > > > > > > code other than ENOMEM?
> > > > > > >    > That seems a bit of a violation of what that function is supposed to do
> > > > > > >
> > > > > >
> > > > > > The API allows LSM authors to decide what error code is returned from the
> > > > > > cred_prepare hook. security_task_alloc() is a similar hook, and has its return
> > > > > > code propagated.
> > > > > It is not an api.  It is an implementation detail of the linux kernel.
> > > > > It is a set of convenient functions that do a job.
> > > > > The general rule is we don't support cases without an in-tree user.  I
> > > > > don't see an in-tree user.
> > > > >
> > > > > > I'm proposing we follow security_task_allocs() pattern, and add visibility for
> > > > > > failure cases in prepare_creds().
> > > > > I am asking why we would want to.  Especially as it is not an API, and I
> > > > > don't see any good reason for anything but an -ENOMEM failure to be
> > > > > supported.
> > > > >
> > > > We're writing a LSM BPF policy, and not a new LSM. Our policy aims to solve
> > > > unprivileged unshare, similar to Debian's patch [1]. We're in a position such
> > > > that we can't use that patch because we can't block _all_ of our applications
> > > > from performing an unshare. We prefer a granular approach. LSM BPF seems like a
> > > > good choice.
> > >
> > > I am quite puzzled why doesn't /proc/sys/user/max_user_namespaces work
> > > for you?
> > >
> >
> > We have the following requirements:
> >
> > 1. Allow list criteria
> > 2. root user must be able to create namespaces whenever
> > 3. Everything else not in 1 & 2 must be denied
> >
> > We use per task attributes to determine whether or not we allow/deny the
> > current call to unshare().
> >
> > /proc/sys/user/max_user_namespaces limits are a bit broad for this level of
> > detail.
> >
> > > > Because LSM BPF exposes these hooks, we should probably treat them as an
> > > > API. From that perspective, userspace expects unshare to return a EPERM
> > > > when the call is denied permissions.
> > >
> > > The BPF code gets to be treated as a out of tree kernel module.
> > >
> > > > > Without an in-tree user that cares it is probably better to go the
> > > > > opposite direction and remove the possibility of return anything but
> > > > > memory allocation failure.  That will make it clearer to implementors
> > > > > that a general error code is not supported and this is not a location
> > > > > to implement policy, this is only a hook to allocate state for the LSM.
> > > > >
> > > >
> > > > That's a good point, and it's possible we're using the wrong hook for the
> > > > policy. Do you know of other hooks we can look into?
>
> Fwiw, from this commit it wasn't very clear what you wanted to achieve
> with this. It might be worth considering adding a new security hook for
> this. Within msft it recently came up SELinux might have an interest in
> something like this as well.

Just to clarify things a bit, I believe SELinux would have an interest
in a LSM hook capable of implementing an access control point for user
namespaces regardless of Microsoft's current needs.  I suspect due to
the security relevant nature of user namespaces most other LSMs would
be interested as well; it seems like a well crafted hook would be
welcome by most folks I think.

-- 
paul-moore.com

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

