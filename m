Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D1B54C652
	for <lists+linux-cachefs@lfdr.de>; Wed, 15 Jun 2022 12:36:51 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-qfUairOfNzWv6JRiwRTDkw-1; Wed, 15 Jun 2022 06:36:48 -0400
X-MC-Unique: qfUairOfNzWv6JRiwRTDkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7970385A584;
	Wed, 15 Jun 2022 10:36:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AFB3C2166B26;
	Wed, 15 Jun 2022 10:36:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7D38A1947042;
	Wed, 15 Jun 2022 10:36:46 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B4FB619466DF for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 15 Jun 2022 10:36:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8C0CB1678F; Wed, 15 Jun 2022 10:36:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86C761131D
 for <linux-cachefs@redhat.com>; Wed, 15 Jun 2022 10:36:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BC6A802804
 for <linux-cachefs@redhat.com>; Wed, 15 Jun 2022 10:36:45 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-mdBPr0wqPX6jB8rvmxDHwA-1; Wed, 15 Jun 2022 06:36:43 -0400
X-MC-Unique: mdBPr0wqPX6jB8rvmxDHwA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6B64BB81CD3;
 Wed, 15 Jun 2022 10:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573BAC34115;
 Wed, 15 Jun 2022 10:30:35 +0000 (UTC)
Date: Wed, 15 Jun 2022 12:30:31 +0200
From: Christian Brauner <brauner@kernel.org>
To: Frederick Lawler <fred@cloudflare.com>
Message-ID: <20220615103031.qkzae4xr34wysj4b@wittgenstein>
References: <20220608150942.776446-1-fred@cloudflare.com>
 <87tu8oze94.fsf@email.froward.int.ebiederm.org>
 <e1b62234-9b8a-e7c2-2946-5ef9f6f23a08@cloudflare.com>
 <87y1xzyhub.fsf@email.froward.int.ebiederm.org>
 <859cb593-9e96-5846-2191-6613677b07c5@cloudflare.com>
 <87o7yvxl4x.fsf@email.froward.int.ebiederm.org>
 <9ed91f15-420c-3db6-8b3b-85438b02bf97@cloudflare.com>
MIME-Version: 1.0
In-Reply-To: <9ed91f15-420c-3db6-8b3b-85438b02bf97@cloudflare.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, linux-doc@vger.kernel.org,
 selinux@vger.kernel.org, linux-cifs@vger.kernel.org,
 Jeff Moyer <jmoyer@redhat.com>, amir73il@gmail.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-cachefs@redhat.com,
 keyrings@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 kernel-team@cloudflare.com, serge@hallyn.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 14, 2022 at 01:59:08PM -0500, Frederick Lawler wrote:
> On 6/14/22 11:30 AM, Eric W. Biederman wrote:
> > Frederick Lawler <fred@cloudflare.com> writes:
> > 
> > > On 6/13/22 11:44 PM, Eric W. Biederman wrote:
> > > > Frederick Lawler <fred@cloudflare.com> writes:
> > > > 
> > > > > Hi Eric,
> > > > > 
> > > > > On 6/13/22 12:04 PM, Eric W. Biederman wrote:
> > > > > > Frederick Lawler <fred@cloudflare.com> writes:
> > > > > > 
> > > > > > > While experimenting with the security_prepare_creds() LSM hook, we
> > > > > > > noticed that our EPERM error code was not propagated up the callstack.
> > > > > > > Instead ENOMEM is always returned.  As a result, some tools may send a
> > > > > > > confusing error message to the user:
> > > > > > > 
> > > > > > > $ unshare -rU
> > > > > > > unshare: unshare failed: Cannot allocate memory
> > > > > > > 
> > > > > > > A user would think that the system didn't have enough memory, when
> > > > > > > instead the action was denied.
> > > > > > > 
> > > > > > > This problem occurs because prepare_creds() and prepare_kernel_cred()
> > > > > > > return NULL when security_prepare_creds() returns an error code. Later,
> > > > > > > functions calling prepare_creds() and prepare_kernel_cred() return
> > > > > > > ENOMEM because they assume that a NULL meant there was no memory
> > > > > > > allocated.
> > > > > > > 
> > > > > > > Fix this by propagating an error code from security_prepare_creds() up
> > > > > > > the callstack.
> > > > > > Why would it make sense for security_prepare_creds to return an error
> > > > > > code other than ENOMEM?
> > > > > >    > That seems a bit of a violation of what that function is supposed to do
> > > > > > 
> > > > > 
> > > > > The API allows LSM authors to decide what error code is returned from the
> > > > > cred_prepare hook. security_task_alloc() is a similar hook, and has its return
> > > > > code propagated.
> > > > It is not an api.  It is an implementation detail of the linux kernel.
> > > > It is a set of convenient functions that do a job.
> > > > The general rule is we don't support cases without an in-tree user.  I
> > > > don't see an in-tree user.
> > > > 
> > > > > I'm proposing we follow security_task_allocs() pattern, and add visibility for
> > > > > failure cases in prepare_creds().
> > > > I am asking why we would want to.  Especially as it is not an API, and I
> > > > don't see any good reason for anything but an -ENOMEM failure to be
> > > > supported.
> > > > 
> > > We're writing a LSM BPF policy, and not a new LSM. Our policy aims to solve
> > > unprivileged unshare, similar to Debian's patch [1]. We're in a position such
> > > that we can't use that patch because we can't block _all_ of our applications
> > > from performing an unshare. We prefer a granular approach. LSM BPF seems like a
> > > good choice.
> > 
> > I am quite puzzled why doesn't /proc/sys/user/max_user_namespaces work
> > for you?
> > 
> 
> We have the following requirements:
> 
> 1. Allow list criteria
> 2. root user must be able to create namespaces whenever
> 3. Everything else not in 1 & 2 must be denied
> 
> We use per task attributes to determine whether or not we allow/deny the
> current call to unshare().
> 
> /proc/sys/user/max_user_namespaces limits are a bit broad for this level of
> detail.
> 
> > > Because LSM BPF exposes these hooks, we should probably treat them as an
> > > API. From that perspective, userspace expects unshare to return a EPERM
> > > when the call is denied permissions.
> > 
> > The BPF code gets to be treated as a out of tree kernel module.
> > 
> > > > Without an in-tree user that cares it is probably better to go the
> > > > opposite direction and remove the possibility of return anything but
> > > > memory allocation failure.  That will make it clearer to implementors
> > > > that a general error code is not supported and this is not a location
> > > > to implement policy, this is only a hook to allocate state for the LSM.
> > > > 
> > > 
> > > That's a good point, and it's possible we're using the wrong hook for the
> > > policy. Do you know of other hooks we can look into?

Fwiw, from this commit it wasn't very clear what you wanted to achieve
with this. It might be worth considering adding a new security hook for
this. Within msft it recently came up SELinux might have an interest in
something like this as well.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

