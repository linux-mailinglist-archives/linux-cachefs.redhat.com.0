Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 55928552CB0
	for <lists+linux-cachefs@lfdr.de>; Tue, 21 Jun 2022 10:18:01 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-0SOKF_4lOqaMX9C8ztDx2g-1; Tue, 21 Jun 2022 04:17:57 -0400
X-MC-Unique: 0SOKF_4lOqaMX9C8ztDx2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80212811E80;
	Tue, 21 Jun 2022 08:17:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 67F132166B26;
	Tue, 21 Jun 2022 08:17:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B33DE1947051;
	Tue, 21 Jun 2022 08:17:54 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4FB2819466DF for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 15 Jun 2022 15:06:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1F0B51121315; Wed, 15 Jun 2022 15:06:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B29B1121314
 for <linux-cachefs@redhat.com>; Wed, 15 Jun 2022 15:06:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6E8B3C11734
 for <linux-cachefs@redhat.com>; Wed, 15 Jun 2022 15:06:20 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-jKpE_5aDNKS8oMQBD6oLrw-1; Wed, 15 Jun 2022 11:06:18 -0400
X-MC-Unique: jKpE_5aDNKS8oMQBD6oLrw-1
Received: by mail-il1-f174.google.com with SMTP id l14so4999775ilq.1
 for <linux-cachefs@redhat.com>; Wed, 15 Jun 2022 08:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j6yW8cSNxyHcKGLBH/RzzZpKDGH+HEQvUp5OHLJ1vSg=;
 b=RunwkEAEcnuQ2VCyV0h6UTXLZ8ahlHXfUgoazJam+DeqA0XFEh3MKFlBsvlZmtwBvW
 8fk3UEcn5/VAh533SnKG6pkGoBcQcYJeWliPcxk57pjgeCQorpViMkYCby52BIXOhEHI
 7GqIga9wGSofo3YIIgZ0YaWszNlaqE3aUXWlj/buV8W95xtkY0gJ+fd+bhK1ia2Xu97a
 JLQmuq6LFuYww4oQrlU58Rybt/bqEi9+YOwVPenvIRSMqTT7T0YCHobCbtFyPO0o5R8d
 gbMlMP7ZsQdKvXW2jK1HgAlvrWMhPa5U7PIk36zqPSKlZFnPk/3Ys7X2gSVPTVIOGYzF
 qq/g==
X-Gm-Message-State: AJIora9q3LpXGT94jPwXARu2Vaf4aV7Ej+8ha+Q4UY58+5BmW4v/d+iv
 wbaqwoSh4zVrl8QncYd1T1DdhQ21qd8fGDuATmfytg==
X-Google-Smtp-Source: AGRyM1vl6hb3B14OhbZ5pyrW5E0uvZJEWyTkyieVnvYbDV9l4KSiSfWp3W3NzE6bbMlKOpxyW1c3ccvo1VZk+jYZkps=
X-Received: by 2002:a05:6e02:1747:b0:2d3:e571:5058 with SMTP id
 y7-20020a056e02174700b002d3e5715058mr142461ill.309.1655305577283; Wed, 15 Jun
 2022 08:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220608150942.776446-1-fred@cloudflare.com>
 <87tu8oze94.fsf@email.froward.int.ebiederm.org>
 <e1b62234-9b8a-e7c2-2946-5ef9f6f23a08@cloudflare.com>
 <87y1xzyhub.fsf@email.froward.int.ebiederm.org>
 <859cb593-9e96-5846-2191-6613677b07c5@cloudflare.com>
 <87o7yvxl4x.fsf@email.froward.int.ebiederm.org>
 <9ed91f15-420c-3db6-8b3b-85438b02bf97@cloudflare.com>
 <20220615103031.qkzae4xr34wysj4b@wittgenstein>
 <CAHC9VhR8yPHZb2sCu4JGgXOSs7rudm=9opB+-LsG6_Lta9466A@mail.gmail.com>
In-Reply-To: <CAHC9VhR8yPHZb2sCu4JGgXOSs7rudm=9opB+-LsG6_Lta9466A@mail.gmail.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 15 Jun 2022 16:06:06 +0100
Message-ID: <CALrw=nGZtrNYn+CV+Q_w-2=Va_9m3C8PDvvPtd01d0tS=2NMWQ@mail.gmail.com>
To: Paul Moore <paul@paul-moore.com>, Christian Brauner <brauner@kernel.org>, 
 "Eric W. Biederman" <ebiederm@xmission.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mailman-Approved-At: Tue, 21 Jun 2022 08:17:53 +0000
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
 samba-technical@lists.samba.org, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-cachefs@redhat.com,
 keyrings@vger.kernel.org, netdev <netdev@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, kernel-team <kernel-team@cloudflare.com>,
 Frederick Lawler <fred@cloudflare.com>, serge@hallyn.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 15, 2022 at 3:14 PM Paul Moore <paul@paul-moore.com> wrote:
>
> On Wed, Jun 15, 2022 at 6:30 AM Christian Brauner <brauner@kernel.org> wrote:
> >
> > On Tue, Jun 14, 2022 at 01:59:08PM -0500, Frederick Lawler wrote:
> > > On 6/14/22 11:30 AM, Eric W. Biederman wrote:
> > > > Frederick Lawler <fred@cloudflare.com> writes:
> > > >
> > > > > On 6/13/22 11:44 PM, Eric W. Biederman wrote:
> > > > > > Frederick Lawler <fred@cloudflare.com> writes:
> > > > > >
> > > > > > > Hi Eric,
> > > > > > >
> > > > > > > On 6/13/22 12:04 PM, Eric W. Biederman wrote:
> > > > > > > > Frederick Lawler <fred@cloudflare.com> writes:
> > > > > > > >
> > > > > > > > > While experimenting with the security_prepare_creds() LSM hook, we
> > > > > > > > > noticed that our EPERM error code was not propagated up the callstack.
> > > > > > > > > Instead ENOMEM is always returned.  As a result, some tools may send a
> > > > > > > > > confusing error message to the user:
> > > > > > > > >
> > > > > > > > > $ unshare -rU
> > > > > > > > > unshare: unshare failed: Cannot allocate memory
> > > > > > > > >
> > > > > > > > > A user would think that the system didn't have enough memory, when
> > > > > > > > > instead the action was denied.
> > > > > > > > >
> > > > > > > > > This problem occurs because prepare_creds() and prepare_kernel_cred()
> > > > > > > > > return NULL when security_prepare_creds() returns an error code. Later,
> > > > > > > > > functions calling prepare_creds() and prepare_kernel_cred() return
> > > > > > > > > ENOMEM because they assume that a NULL meant there was no memory
> > > > > > > > > allocated.
> > > > > > > > >
> > > > > > > > > Fix this by propagating an error code from security_prepare_creds() up
> > > > > > > > > the callstack.
> > > > > > > > Why would it make sense for security_prepare_creds to return an error
> > > > > > > > code other than ENOMEM?
> > > > > > > >    > That seems a bit of a violation of what that function is supposed to do
> > > > > > > >
> > > > > > >
> > > > > > > The API allows LSM authors to decide what error code is returned from the
> > > > > > > cred_prepare hook. security_task_alloc() is a similar hook, and has its return
> > > > > > > code propagated.
> > > > > > It is not an api.  It is an implementation detail of the linux kernel.
> > > > > > It is a set of convenient functions that do a job.
> > > > > > The general rule is we don't support cases without an in-tree user.  I
> > > > > > don't see an in-tree user.
> > > > > >
> > > > > > > I'm proposing we follow security_task_allocs() pattern, and add visibility for
> > > > > > > failure cases in prepare_creds().
> > > > > > I am asking why we would want to.  Especially as it is not an API, and I
> > > > > > don't see any good reason for anything but an -ENOMEM failure to be
> > > > > > supported.
> > > > > >
> > > > > We're writing a LSM BPF policy, and not a new LSM. Our policy aims to solve
> > > > > unprivileged unshare, similar to Debian's patch [1]. We're in a position such
> > > > > that we can't use that patch because we can't block _all_ of our applications
> > > > > from performing an unshare. We prefer a granular approach. LSM BPF seems like a
> > > > > good choice.
> > > >
> > > > I am quite puzzled why doesn't /proc/sys/user/max_user_namespaces work
> > > > for you?
> > > >
> > >
> > > We have the following requirements:
> > >
> > > 1. Allow list criteria
> > > 2. root user must be able to create namespaces whenever
> > > 3. Everything else not in 1 & 2 must be denied
> > >
> > > We use per task attributes to determine whether or not we allow/deny the
> > > current call to unshare().
> > >
> > > /proc/sys/user/max_user_namespaces limits are a bit broad for this level of
> > > detail.
> > >
> > > > > Because LSM BPF exposes these hooks, we should probably treat them as an
> > > > > API. From that perspective, userspace expects unshare to return a EPERM
> > > > > when the call is denied permissions.
> > > >
> > > > The BPF code gets to be treated as a out of tree kernel module.
> > > >
> > > > > > Without an in-tree user that cares it is probably better to go the
> > > > > > opposite direction and remove the possibility of return anything but
> > > > > > memory allocation failure.  That will make it clearer to implementors
> > > > > > that a general error code is not supported and this is not a location
> > > > > > to implement policy, this is only a hook to allocate state for the LSM.
> > > > > >
> > > > >
> > > > > That's a good point, and it's possible we're using the wrong hook for the
> > > > > policy. Do you know of other hooks we can look into?
> >
> > Fwiw, from this commit it wasn't very clear what you wanted to achieve
> > with this. It might be worth considering adding a new security hook for
> > this. Within msft it recently came up SELinux might have an interest in
> > something like this as well.
>
> Just to clarify things a bit, I believe SELinux would have an interest
> in a LSM hook capable of implementing an access control point for user
> namespaces regardless of Microsoft's current needs.  I suspect due to
> the security relevant nature of user namespaces most other LSMs would
> be interested as well; it seems like a well crafted hook would be
> welcome by most folks I think.
>
> --
> paul-moore.com

Just to get the full picture: is there actually a good reason not to
make this hook support this scenario? I understand it was not
originally intended for this, but it is well positioned in the code,
covers multiple subsystems (not only user namespaces), doesn't require
changing the LSM interface and it already does the job - just the
kernel internals need to respect the error code better. What bad
things can happen if we extend its use case to not only allocate
resources in LSMs?

After all, the original Linus email introducing Linux stated that
Linux was not intended to be a great OS, but here we are :)

Ignat

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

