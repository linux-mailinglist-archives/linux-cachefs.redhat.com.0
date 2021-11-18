Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B683F45606E
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Nov 2021 17:28:02 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-ZMOwqewCOcu8e0OBh_4Mkw-1; Thu, 18 Nov 2021 11:27:58 -0500
X-MC-Unique: ZMOwqewCOcu8e0OBh_4Mkw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 072D319200C2;
	Thu, 18 Nov 2021 16:27:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 710C45DAA5;
	Thu, 18 Nov 2021 16:27:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 214BB180BAD1;
	Thu, 18 Nov 2021 16:27:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AIGRPqN027621 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 18 Nov 2021 11:27:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3EA5B400DFBC; Thu, 18 Nov 2021 16:27:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37C6640CFD10
	for <linux-cachefs@redhat.com>; Thu, 18 Nov 2021 16:27:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12297811E81
	for <linux-cachefs@redhat.com>; Thu, 18 Nov 2021 16:27:25 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-123-HXC3zUCuPcueMHpOAI9lNA-1; Thu, 18 Nov 2021 11:27:22 -0500
X-MC-Unique: HXC3zUCuPcueMHpOAI9lNA-1
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	1AIFfcVm020982; Thu, 18 Nov 2021 16:27:19 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by mx0b-00069f02.pphosted.com with ESMTP id 3cd4qyqme0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Nov 2021 16:27:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AIGALbM038496;
	Thu, 18 Nov 2021 16:26:58 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
	(mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by userp3030.oracle.com with ESMTP id 3ca2g0rnfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Nov 2021 16:26:58 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
	by BYAPR10MB2711.namprd10.prod.outlook.com (2603:10b6:a02:ba::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26;
	Thu, 18 Nov 2021 16:26:56 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
	([fe80::2ded:9640:8225:8200]) by
	SJ0PR10MB4688.namprd10.prod.outlook.com
	([fe80::2ded:9640:8225:8200%6]) with mapi id 15.20.4690.027;
	Thu, 18 Nov 2021 16:26:55 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Dave Wysochanski <dwysocha@redhat.com>, Trond Myklebust
	<trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Thread-Topic: [PATCH 0/7] Cleanups for NFS fscache and convert from dfprintk
	to trace events
Thread-Index: AQHX3ADv2oWEXSsDwkedfJbhYLskMqwJejAA
Date: Thu, 18 Nov 2021 16:26:55 +0000
Message-ID: <A26894CC-ECE3-4168-8038-1D05122F4A0F@oracle.com>
References: <1637187438-18858-1-git-send-email-dwysocha@redhat.com>
In-Reply-To: <1637187438-18858-1-git-send-email-dwysocha@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55c86922-c340-4e73-7290-08d9aab03cc1
x-ms-traffictypediagnostic: BYAPR10MB2711:
x-microsoft-antispam-prvs: <BYAPR10MB2711A05BDEF2B255172E63B8939B9@BYAPR10MB2711.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: Rv2PF+fbcwyeYiPj8r7/pbIDXMZHn7OM2mLIpTc+E+f+9GXWPN93cndSfWItOpNlQlT7PyHO5vQSImYto+k0TjLyqju/76FTpJJ1rtS1f50P2jYIe0dm20n5SK/WdcjOSJlALLDIFs+s1qYQ793yBWYsuc1Om+aAeLVKudhrGBadRoCleLFJL/9d/auUxUrTI05wSSsBFPx4zcxkf09a8Lv+V62tzCrnaG4CbAapNJo2oLWM0bG0JRA1JoDSEBqO1ZHRD6mw9Bj8cQl5pNAec2rgX95YIIxYvyjq9+UfGP+xSTTevIANePxgcmiDjGCbS6Dx/Rs7K7I4HY+MaU5oArhxWapok8H4JQ1Ykg0S2eRzFpZZxutHmcts5oXFB9I3gsm0sukTBmT4plLDrFezQ8vzBUMei0Ow0Eo9M9+dGVNzQ7K/YdX7pEIMy+L+O+SfyNzmHtjtg85zGKXlkTDVEgT+9c4RatY807I+Px0OkGS4LtLOSXEG1MPKZHWI1rzHGcaB8EpK1wf5gZY7n+mCX10E3y3hMxW+TSqXGeKEVKlLGbt1Lysk2DRKkxX+4DWTEFHfov7unpuROjJ+/oENFvRJD7/1wpE5O5sMffuUheydqg8cM/KyJRdLlnkN1C6hKTOPFa27K/DxpoISgDkO1Hvd1L8wJJ0p3U7e5+UMiYVBRgU4RDZau6Bv2VI/mKKQ5LjI10nMp1SJz09yu5LwEW8J9WwvxPGpTNpFRFblP4E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR10MB4688.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(64756008)(26005)(66556008)(316002)(66476007)(71200400001)(53546011)(36756003)(2906002)(4326008)(5660300002)(6506007)(66946007)(76116006)(91956017)(83380400001)(8936002)(38100700002)(6486002)(86362001)(6512007)(122000001)(110136005)(54906003)(186003)(8676002)(508600001)(2616005)(38070700005)(33656002)(66446008)(45980500001);
	DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N0dO/EGrlJJSinsjwuAUYfiy1XBL/Tdo0GrptlAQaK4oIgHfMKcUQq8Ui1c9?=
	=?us-ascii?Q?uUrRYmLg6qdbCGrknhN+NJR0j4/jPhDS8X5vWHjV+cxLQuhdUbWhqX0fxGi6?=
	=?us-ascii?Q?tjbNfnhyHACmnN6OguS/5HxGwSbqvqJfwNwXDF7b4ZV1eXXFirRrTiUfP/X9?=
	=?us-ascii?Q?E4kxKO+nPIlrjfDyXySdWVGtDB/kimYxWG+8vj9te53c5w+KJlj1/K7u72em?=
	=?us-ascii?Q?JsiZU3QNmay02MOzyrck4i0AoxYWQ/iBxQBsKLXIEGYlUsDZKlHRIMhrHcuu?=
	=?us-ascii?Q?aIILDsiuYVsOxXnHZXRV24wB0f6IMdAZjqKM4nwSOnCXrNA/JRCMj2a1hfvu?=
	=?us-ascii?Q?yaqoejrR5mzIlNKXWlwnd/6uq2XDcT/E2bQm+KhCaOSnpDhbNXOsaV7vwYI0?=
	=?us-ascii?Q?Byk6aXck23753ipRdiYj03voAebEYsLJNOWbq61mxcXElyWx2zLkENluGcwy?=
	=?us-ascii?Q?zzKGth8ETLWenotuAezh9NL+0s/hy8LrDbG0HoxoI+UUISddFsx7mHp+KxY8?=
	=?us-ascii?Q?c5EXzorYpTv10npKMgx8Avnm+jAKxoN1a9UJcCwtPBb+X55m3SxKFyAFFpiC?=
	=?us-ascii?Q?AjwHXwo3BdHUBTSDVpJsICiMjqG+wnPapx/87s2mjtksyNwXuSoKKCuzAQkq?=
	=?us-ascii?Q?LJdAM3e5APyWOJ3TYCrjh5mfYksWNqOe0l1g/1f1HiRtBVrG5QhReqcK6ey4?=
	=?us-ascii?Q?NdJNVLO/wP5zaO3ajX69kTudYcgS/omaKmwD9lKK4NKnN0MqZwK5hRfsmcU+?=
	=?us-ascii?Q?gP73LcU09+6brtRlsjcsT9GP8NH17beFADrtTZwZz+cNamz/iO7Z1qRR8zIo?=
	=?us-ascii?Q?stsZBTxKwo4X2vGlmxLGg6g2+F+OiXA+BoR8Wld4+yd0M7mB8IhUVzkZCSVr?=
	=?us-ascii?Q?1Mn7M1HuPF9hx69C8Eege4pW5Di4scZ87IJSLr6ATott/wgzHLHSfZlyyVz5?=
	=?us-ascii?Q?cUdu+1RL5MdR7BH2HjEA3Ttwywupmuy32PaaeJNXG/Ls35XQ+dySFTvPWAx7?=
	=?us-ascii?Q?YkInG+bL9Q2pxSEnLy4CQn18GSAbN02gZbgIDJgdr8A+IA4qc/s7wNNeDcPe?=
	=?us-ascii?Q?dt7MMIylGgp6Djw2sNcRlMQVhELy7FJv4ipsAabjWkGlj4grVrFRL4kcgzzY?=
	=?us-ascii?Q?JwP9vZIveT4qh9dyPE5sTnRXwfer6PcIEQv1lgC/4zeaWoYylFcnWKJw5t1p?=
	=?us-ascii?Q?utngfcmHV+Y1KzIFwc520flzyQuizdmf16OX+X4RVVYw0sCEXQBheDXcNr5L?=
	=?us-ascii?Q?1DkVVHwcG2AcQ0kpWUv9P1Pq2bhPcd1b+FULq7SclQ5TAgMZVF3+AyGOkHcA?=
	=?us-ascii?Q?zD5Or1cFV0hpXXHdcJbkaC2kF1cWx0imBbxiaXt1v1XTB+WNtz190+yBZIv2?=
	=?us-ascii?Q?orsm2LG5/vv/V7OLvjlVEzjxCDZecvOvT+5dF6eV6TQ8ZMFKjsmAiajaL9nl?=
	=?us-ascii?Q?bfdzFgztt09WQVMMzyZg6123fsx4cc5AizaoN34JP85F4anCI922j9noJn0s?=
	=?us-ascii?Q?qgjUBLSibLqfD/fyJPGvc6Doy/FRNQzSNqEh6w3jq4QSaIB/V0b/tLG1Kb0j?=
	=?us-ascii?Q?nh5mliBjeCFpJm58JqX7k9rQ7lU4PM9U0Ecbcct0UfuOq6cnD4+O1EQzqlJ+?=
	=?us-ascii?Q?ijoNz0pr/GuwxZdou7brSpE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c86922-c340-4e73-7290-08d9aab03cc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 16:26:55.9295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ejjNzX3vEHZECnxwXBOZ85QQ/RDWYJhEDV/iYQbniE/hmrTz0AuR2zeV4nlbxu72J21ecMCIBJ/mCLn3nuSZ2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2711
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10172
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	phishscore=0 bulkscore=0
	adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2110150000 definitions=main-2111180090
X-Proofpoint-ORIG-GUID: d3bGPbHmIAXGXjAehwp4uDBVnsy84mwD
X-Proofpoint-GUID: d3bGPbHmIAXGXjAehwp4uDBVnsy84mwD
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1AIGRPqN027621
X-loop: linux-cachefs@redhat.com
Cc: Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
Subject: Re: [Linux-cachefs] [PATCH 0/7] Cleanups for NFS fscache and
 convert from dfprintk to trace events
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
Content-Language: en-US
Content-ID: <021CAB36C9F10043B8F042E4AD5BE44B@namprd10.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> On Nov 17, 2021, at 5:17 PM, Dave Wysochanski <dwysocha@redhat.com> wrote:
> 
> The first 3 patches are cleanups and refactorings of the NFS fscache code.
> The last 4 patches convert dfprintks to trace events in the NFS fscache code.
> These patches were built / tested on 5.16.0-rc1.
> 
> Dave Wysochanski (7):
>  NFS: Use nfs_i_fscache() consistently within NFS fscache code
>  NFS: Cleanup usage of nfs_inode in fscache interface and handle i_size
>    properly
>  NFS: Rename fscache read and write pages functions
>  NFS: Convert NFS fscache enable/disable dfprintks to tracepoints
>  NFS: Replace dfprintks with tracepoints in fscache read and write page
>    functions
>  NFS: Remove remaining dfprintks related to fscache cookies
>  NFS: Remove remaining usages of NFSDBG_FSCACHE
> 
> fs/nfs/fscache-index.c      |   2 -
> fs/nfs/fscache.c            | 106 ++++++++++++++++----------------------------
> fs/nfs/fscache.h            |  33 +++++++-------
> fs/nfs/nfstrace.h           | 103 ++++++++++++++++++++++++++++++++++++++++++
> fs/nfs/read.c               |   6 +--
> include/uapi/linux/nfs_fs.h |   2 +-
> 6 files changed, 162 insertions(+), 90 deletions(-)

Series Reviewed-by: Chuck Lever <chuck.lever@oracle.com>


--
Chuck Lever




--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

