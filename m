Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 305A8489094
	for <lists+linux-cachefs@lfdr.de>; Mon, 10 Jan 2022 08:13:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-8DRKA5NDMyeHHCtI-uWRQg-1; Mon, 10 Jan 2022 02:13:49 -0500
X-MC-Unique: 8DRKA5NDMyeHHCtI-uWRQg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27AB01853022;
	Mon, 10 Jan 2022 07:13:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50CD116A5E;
	Mon, 10 Jan 2022 07:13:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CD4A1809CB8;
	Mon, 10 Jan 2022 07:13:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20A5NMdc005251 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 10 Jan 2022 00:23:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E78FC46D212; Mon, 10 Jan 2022 05:23:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3BEE46D1E7
	for <linux-cachefs@redhat.com>; Mon, 10 Jan 2022 05:23:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C52753804068
	for <linux-cachefs@redhat.com>; Mon, 10 Jan 2022 05:23:21 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-306-BrBocFu3OQ6xjNkHXXGAjQ-1; Mon, 10 Jan 2022 00:23:19 -0500
X-MC-Unique: BrBocFu3OQ6xjNkHXXGAjQ-1
Received: by mail-pj1-f41.google.com with SMTP id pj2so11083777pjb.2;
	Sun, 09 Jan 2022 21:23:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=KLDeCAxX3CU8jwdPn2L7tHgha37knc4qQNnoOY9NpVo=;
	b=uiEiwQQsAroTiT0Ew+q7MgtN+5dajfuLEwK2j6PhZji3HDxeiI3nuN/j8LgkjWpXCZ
	rztCmkyeYN42WlcG+VeHH+wScuFmABMdv/75yNk/9OJMDi3+3NBKohxPf3+feZVw+b6i
	gQBTfrv69uTLurlZSQHDYxJmvtD/Q6AvXv7OiO+QtTPiINGmnXKGpPcmQdIcMFua0tln
	5rfeniBj2z21yf8MyI/MZ70UYUUe1H5mjs2ug4spt4CXjqjnMaeJDb4jpg8MSQjCrM0t
	UgYi6B36VHLwkeaIEKP/EunFd5dc3g5efQZm+Es43ckPSlzUrzL07sI3qqfYbA10WLHc
	xdMA==
X-Gm-Message-State: AOAM530ck8E1MlPF0H+7QK1bVlaSjV6FQQp50GQEM3gaIR7nnTNFyXaT
	CoLtaqta9XXqwpAkyXQ57Mfo4A6r3+4=
X-Google-Smtp-Source: ABdhPJy4i2q2HIlZABRqBnLuop/odqzFU1ni9lsZwhnMZrtvrATEPO5fdcAPvKCSSChjJYnraV1/0w==
X-Received: by 2002:a17:903:1209:b0:149:a428:19ef with SMTP id
	l9-20020a170903120900b00149a42819efmr46362475plh.47.1641792197788;
	Sun, 09 Jan 2022 21:23:17 -0800 (PST)
Received: from xzhoux.usersys.redhat.com ([209.132.188.80])
	by smtp.gmail.com with ESMTPSA id
	o7sm5104559pfu.108.2022.01.09.21.23.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Jan 2022 21:23:17 -0800 (PST)
Date: Mon, 10 Jan 2022 13:23:13 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Murphy Zhou <jencce.kernel@gmail.com>, linux-cachefs@redhat.com,
	David Howells <dhowells@redhat.com>
Message-ID: <20220110052313.ax6ory7xaevbttoe@xzhoux.usersys.redhat.com>
References: <CADJHv_u3bqj82sFUWT=JJBWd1kjc14FUbVBd_9r18cMQOeudJw@mail.gmail.com>
	<CANT5p=rjTGNu2WooxRcu4JMM9wSyYY6S3kXtdfQ5caj1WnAEOA@mail.gmail.com>
	<CANT5p=pW1t5ggVsrMgNWi+CBpym5XXQ1dSwm-eH=vpczmL_nTg@mail.gmail.com>
	<CANT5p=oQeR90LPJKRUJ6eF+ti3Mefs48FfasT=fE79vyZKQU5g@mail.gmail.com>
	<CADJHv_s1-P20E=m+tWMYtWF-vJjcsEC3jq4Qd7seLxFJebgX2g@mail.gmail.com>
	<CADJHv_tfZRPtXqxTG-cnkXx=BQjq-danJQ0Q-rZZwS8PeCr_Eg@mail.gmail.com>
	<CANT5p=pdtZ0nNQYat6CJDqGQawiEnPAbST=1Q8JKs9GN9oA8nw@mail.gmail.com>
	<CADJHv_uZPY374k6vtbk2_VSC3YhejDT0fuuvyEJm6y2weqGLmg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADJHv_uZPY374k6vtbk2_VSC3YhejDT0fuuvyEJm6y2weqGLmg@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 10 Jan 2022 02:13:38 -0500
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <smfrench@gmail.com>
Subject: Re: [Linux-cachefs] [ linux-next ] 20211206 tree cifs panic
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi all,

It's still reproducible on the latest next-20210107 tree with below
reproducer.

Reverting this fscache update makes the panic gone.

  574146fe263a Merge branch 'fscache-next' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git

Thanks,
Murphy

On Wed, Dec 22, 2021 at 10:16:44AM +0800, Murphy Zhou wrote:
> A bit late.
> 
> Try this:
> 
> rm -rf cthon04
> git clone git://git.linux-nfs.org/projects/steved/cthon04.git
> pushd cthon04
> make clean || exit
> make FSTYPE=cifs >cthon04-build.log 2>&1 || exit
> popd
> 
> rm -fr /tmp/connectathon
> mkdir -p /tmp/connectathon
> chmod 1777 /tmp/connectathon
> chcon -t samba_share_t /tmp/connectathon
> cat > /etc/samba/smb.conf <<EOF
> [global]
>     workgroup = EXAMPLE
>     unix extensions = no
>     ea support = Yes
>     min protocol = NT1
> 
> [testuser]
>     comment = testuser unix extensions off
>     path = /tmp/connectathon
>     read only = No
>     #acl check permissions = No
>     #acl map full control = No
> EOF
> echo -e 'redhat\nredhat' | smbpasswd -s -a root
> service smb restart
> sleep 5
> 
> pushd cthon04
> smbclient -L //$(hostname)/testuser -N
> echo "y\n" | ./server -o
> actimeo=0,user=root,password=redhat,domain=EXAMPLE,file_mode=0777,rw,noauto
> -C -a -f -p testuser -m /mnt/connectathon $(hostname) -b
> popd
> 
> 
> On Sat, Dec 11, 2021 at 11:33 AM Shyam Prasad N <nspmangalore@gmail.com> wrote:
> >
> >
> >
> > On Fri, Dec 10, 2021 at 11:37 AM Murphy Zhou <jencce.kernel@gmail.com> wrote:
> >>
> >> The patch can't be applied on the 1208 tree and does not fix the issue
> >> on the 1207 tree.
> >>
> > Hi Murphy,
> >
> > Which is the git repo and branch that you're using? Is it reproducible consistently?
> > And is it a ksmbd server? Or samba server? Can you share the conf file for that as well?
> > I'm unable to repro this issue.
> >
> > Regards,
> > Shyam
> >
> >> On Thu, Dec 9, 2021 at 7:05 PM Murphy Zhou <jencce.kernel@gmail.com> wrote:
> >> >
> >> > Test is running.
> >> >
> >> > And the kernel config is attached.
> >> >
> >> > Thanks for looking into this!
> >> >
> >> > On Thu, Dec 9, 2021 at 6:53 PM Shyam Prasad N <nspmangalore@gmail.com> wrote:
> >> > >
> >> > > On Thu, Dec 9, 2021 at 3:06 PM Shyam Prasad N <nspmangalore@gmail.com> wrote:
> >> > > >
> >> > > > On Thu, Dec 9, 2021 at 2:40 PM Shyam Prasad N <nspmangalore@gmail.com> wrote:
> >> > > > >
> >> > > > > Hi Murphy,
> >> > > > >
> >> > > > > Can you please share the kernel config file used for this test?
> >> > > > > Is cachefilesd configured on this test setup?
> >> > > > >
> >> > > > > Regards,
> >> > > > > Shyam
> >> > > > >
> >> > > > > On Wed, Dec 8, 2021 at 2:57 PM Murphy Zhou <jencce.kernel@gmail.com> wrote:
> >> > > > > >
> >> > > > > > Hi,
> >> > > > > >
> >> > > > > > A connectathon test triggers panic like below. The server is a  smb
> >> > > > > > share on the same server with the test client.
> >> > > > > >
> >> > > > > >
> >> > > > > > [  594.061343] Key type cifs.spnego registered
> >> > > > > > [  594.082337] Key type cifs.idmap registered
> >> > > > > > [  594.104961] CIFS: No dialect specified on mount. Default has
> >> > > > > > changed to a more secure dialect, SMB2.1 or later (e.g. SMB3.1.1),
> >> > > > > > from CIFS (SMB1). To use the less secure SMB1 dialect to access old
> >> > > > > > servers which do not support SMB3.1.1 (or even SMB3 or SMB2.1) specify
> >> > > > > > vers=1.0 on mount.
> >> > > > > > [  594.223460] CIFS: Attempting to mount \\hp-dl380pg8\testuser
> >> > > > > > [  594.287771] BUG: kernel NULL pointer dereference, address: 0000000000000000
> >> > > > > > [  594.319712] #PF: supervisor write access in kernel mode
> >> > > > > > [  594.343627] #PF: error_code(0x0002) - not-present page
> >> > > > > > [  594.366791] PGD 0 P4D 0
> >> > > > > > [  594.378172] Oops: 0002 [#1] PREEMPT SMP PTI
> >> > > > > > [  594.397047] CPU: 0 PID: 52196 Comm: mount.cifs Kdump: loaded
> >> > > > > > Tainted: G          I       5.16.0-rc4-next-20211206 #1
> >> > > > > > [  594.445144] Hardware name: HP ProLiant DL380p Gen8, BIOS P70 08/02/2014
> >> > > > > > [  594.475201] RIP: 0010:cifs_fscache_get_inode_cookie+0x2f/0xb0 [cifs]
> >> > > > > > [  594.503934] Code: 53 48 89 fb 48 83 ec 20 65 48 8b 04 25 28 00 00
> >> > > > > > 00 48 89 44 24 18 48 8b 47 28 48 8b b8 88 03 00 00 e8 35 c6 fa ff 48
> >> > > > > > 8b 53 68 <48> 89 14 25 00 00 00 00 48 8b 53 70 89 14 25 10 00 00 00 48
> >> > > > > > 8b 53
> >> > > > > > [  594.590004] RSP: 0018:ffffb93c4998fc10 EFLAGS: 00010282
> >> > > > > > [  594.614861] RAX: ffff970743ab5000 RBX: ffff970411193168 RCX: 0000000000000000
> >> > > > > > [  594.650920] RDX: 0000000061b01059 RSI: 00000000000041ed RDI: ffff970453924780
> >> > > > > > [  594.686189] RBP: ffffb93c4998fce8 R08: ffff970411193168 R09: ffff970743ab1548
> >> > > > > > [  594.718776] R10: 000000009f8bdc24 R11: 000000009053e561 R12: 000000000e1c25d9
> >> > > > > > [  594.750925] R13: ffff970411193168 R14: ffff970743ab1000 R15: ffff970743ab5000
> >> > > > > > [  594.783532] FS:  00007f2037080780(0000) GS:ffff97072f600000(0000)
> >> > > > > > knlGS:0000000000000000
> >> > > > > > [  594.820129] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> > > > > > [  594.846183] CR2: 0000000000000000 CR3: 0000000141820006 CR4: 00000000001706f0
> >> > > > > > [  594.878376] Call Trace:
> >> > > > > > [  594.889469]  <TASK>
> >> > > > > > [  594.898870]  cifs_iget+0x14b/0x160 [cifs]
> >> > > > > > [  594.917781]  cifs_get_inode_info+0x430/0x750 [cifs]
> >> > > > > > [  594.941267]  ? __d_instantiate+0x34/0xf0
> >> > > > > > [  594.960012]  ? _raw_spin_unlock+0x16/0x30
> >> > > > > > [  594.978111]  ? d_instantiate+0x3e/0x60
> >> > > > > > [  594.994982]  cifs_root_iget+0x33b/0x4b0 [cifs]
> >> > > > > > [  595.015099]  cifs_read_super+0x125/0x200 [cifs]
> >> > > > > > [  595.035596]  cifs_smb3_do_mount+0x224/0x330 [cifs]
> >> > > > > > [  595.057009]  smb3_get_tree+0x2d/0x50 [cifs]
> >> > > > > > [  595.076065]  vfs_get_tree+0x25/0xb0
> >> > > > > > [  595.092562]  do_new_mount+0x176/0x310
> >> > > > > > [  595.110929]  __x64_sys_mount+0x103/0x140
> >> > > > > > [  595.130439]  do_syscall_64+0x3b/0x90
> >> > > > > > [  595.147929]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> >> > > > > > [  595.172646] RIP: 0033:0x7f2037195c4e
> >> > > > > > [  595.188703] Code: 48 8b 0d dd 71 0e 00 f7 d8 64 89 01 48 83 c8 ff
> >> > > > > > c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 a5 00 00
> >> > > > > > 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d aa 71 0e 00 f7 d8 64 89
> >> > > > > > 01 48
> >> > > > > > [  595.273644] RSP: 002b:00007fff27645a38 EFLAGS: 00000202 ORIG_RAX:
> >> > > > > > 00000000000000a5
> >> > > > > > [  595.307790] RAX: ffffffffffffffda RBX: 000055690a1bb910 RCX: 00007f2037195c4e
> >> > > > > > [  595.340187] RDX: 0000556908d5946b RSI: 0000556908d594b6 RDI: 00007fff27647fbe
> >> > > > > > [  595.372419] RBP: 000055690a1bb8f0 R08: 000055690a1bb910 R09: 0000000000000077
> >> > > > > > [  595.404633] R10: 0000000000000000 R11: 0000000000000202 R12: 00007fff27647fb3
> >> > > > > > [  595.436882] R13: 00007f203729d000 R14: 00007f203729f70e R15: 00007fff27647fbe
> >> > > > > > [  595.468980]  </TASK>
> >> > > > > > [  595.478769] Modules linked in: cifs cifs_arc4 cifs_md4 loop nfsv3
> >> > > > > > rpcsec_gss_krb5 nfsv4 dns_resolver nfs fscache netfs rpcrdma rdma_cm
> >> > > > > > iw_cm ib_cm ib_core nfsd auth_rpcgss nfs_acl lockd grace rfkill sunrpc
> >> > > > > > intel_rapl_msr intel_rapl_common sb_edac x86_pkg_temp_thermal
> >> > > > > > intel_powerclamp mgag200 coretemp i2c_algo_bit kvm_intel
> >> > > > > > drm_shmem_helper drm_kms_helper ipmi_ssif iTCO_wdt kvm
> >> > > > > > iTCO_vendor_support acpi_ipmi syscopyarea irqbypass sysfillrect
> >> > > > > > ipmi_si rapl intel_cstate ioatdma ipmi_devintf sysimgblt intel_uncore
> >> > > > > > fb_sys_fops cec lpc_ich ipmi_msghandler acpi_power_meter pcspkr dca
> >> > > > > > hpilo drm fuse xfs libcrc32c sr_mod cdrom sd_mod ata_generic t10_pi sg
> >> > > > > > ata_piix crct10dif_pclmul crc32_pclmul crc32c_intel libata serio_raw
> >> > > > > > tg3 ghash_clmulni_intel hpsa hpwdt scsi_transport_sas dm_mirror
> >> > > > > > dm_region_hash dm_log dm_mod
> >> > > > > > [  595.821049] CR2: 0000000000000000
> >> > > > >
> >> > > > >
> >> > > > >
> >> > > > > --
> >> > > > > Regards,
> >> > > > > Shyam
> >> > > >
> >> > > > This does not repro against a Windows server.
> >> > > > My suspicion is that the recent change of location of
> >> > > > cifs_fscache_get_super_cookie to cifs_root_iget caused this. We maybe
> >> > > > trying to initialize the inode cookie when the super cookie is yet to
> >> > > > be initialized.
> >> > > >
> >> > > > The bigger point here is that there seems to be a circular dependency:
> >> > > > We need tcon->resource_id to setup the super cookie. This is populated
> >> > > > using inode number of root directory. Getting this inode number needs
> >> > > > opening of the root dir. Open causes inode cookie to be initialized,
> >> > > > which trips when it sees that the super cookie is still NULL.
> >> > > >
> >> > > > Steve: Do you agree with this assessment? How do we fix this? Can we
> >> > > > use some other value for resource_id, and not have to rely on the root
> >> > > > inode number? How about tcon->tid? Or a combination of tcon->tid and
> >> > > > ses->Suid?
> >> > > >
> >> > > > --
> >> > > > Regards,
> >> > > > Shyam
> >> > >
> >> > > Hi Murphy,
> >> > >
> >> > > Will you be able to test out with this patch as a possible fix for this issue?
> >> > >
> >> > > --
> >> > > Regards,
> >> > > Shyam
> >
> >
> >
> > --
> > Regards,
> > Shyam

-- 
Murphy

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

